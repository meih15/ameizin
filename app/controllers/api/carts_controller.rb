class Api::CartsController < ApplicationController


    # def index
    #     # @cart_items = current_user.cart
    #     @cart_items = current_user.carts
    #     render :index
    # end

    def show
        if current_user
            @cart = current_user.cart
            debugger
            render :show
        else
            if session[:cart] 
                @cart = Cart.find(session[:cart])
                render :show
            else
                @cart = Cart.create
                session[:cart] = @cart.id
                render :show
            end
        end
    end

    # def create
    #     @cart_item = Cart.new(cart_params)
    #     if @cart_item.save
    #         render :show
    #     else
    #         render json: { errors: @cart_item.errors.full_messages }
    #     end
    # end

    # def update
    #     @cart_item = Cart.find_by(product_id: cart_params[:product_id], user_id: current_user.id)
    #     if @cart_item
    #         @cart_item.quantity = cart_params[:quantity].to_i
    #         @cart_item.save
    #         render :show
    #     else
    #         render json: {errors: 'Could not update quantity'}
    #     end
    # end

    # def destroy
    #     @cart_item = Cart.find_by(id: params[:id])
    #     if @cart_item.destroy
    #         render json: {}
    #     end

    # end



end
