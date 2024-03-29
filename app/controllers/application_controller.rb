class ApplicationController < ActionController::API
    include ActionController::RequestForgeryProtection
    include ActionController::Cookies
    protect_from_forgery with: :exception
    before_action :snake_case_params, :attach_authenticity_token
    rescue_from StandardError, with: :unhandled_error
    rescue_from ActionController::InvalidAuthenticityToken,
        with: :invalid_authenticity_token


    def logged_in?
        !!current_user
    end
    
    # def current_cart
    #     if logged_in?
    #         @cart = current_user.cart
    #     else
    #         if cookies[:cart]
    #             @cart = Cart.find_by(id: cookies[:cart])
    #         else
    #             @cart = Cart.create!
    #             cookies[:cart] = @cart.id
    #         end
    #     end
    # end

    def persist_cart_items_through_login
        if cookies[:cart]

            if current_user.cart == nil
                user_cart = Cart.create!(user_id: current_user.id)
            else
                user_cart = current_user.cart
            end
        
            guest_cart = Cart.find(cookies[:cart])
            guest_cart.cart_items.each {|item| CartItem.create(
                cart_id: user_cart.id,
                product_id: item.product_id,
                quantity: item.quantity
            )}
    
            cart_items = CartItem.all
            cart_items.each {|item| item.delete if item.cart.user_id == nil}
            guest_cart.destroy
            cookies[:cart] = nil
        end
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
    
    def login!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
        persist_cart_items_through_login
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_in
        unless current_user
            render json: { message: 'Unauthorized' }, status: :unauthorized 
        end
    end
    
    def test
      if params.has_key?(:login)
        login!(User.first)
      elsif params.has_key?(:logout)
        logout!
    end

    if current_user
        render json: { user: current_user.slice('id', 'user_name', 'session_token') }
      else
        render json: ['No current user']
      end
    end
    
    private
    def snake_case_params
        params.deep_transform_keys!(&:underscore)
    end  

    def attach_authenticity_token
      headers['X-CSRF-Token'] = masked_authenticity_token(session)
    end

    def invalid_authenticity_token
        render json: { message: 'Invalid authenticity token' }, 
        status: :unprocessable_entity
    end

    def unhandled_error(error)
        if request.accepts.first.html?
            raise error
        else
            @message = "#{error.class} - #{error.message}"
            @stack = Rails::BacktraceCleaner.new.clean(error.backtrace)
            render 'api/errors/internal_server_error', status: :internal_server_error
    
            logger.error "\n#{@message}:\n\t#{@stack.join("\n\t")}\n"
        end
    end

end
