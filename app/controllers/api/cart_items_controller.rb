class Api::CartItemsController < ApplicationController

    def index
        if current_user&.cart
            @cart_items = current_user.cart.cart_items 
            render :index
        else
            if session[:cart]
                @cart = Cart.find(session[:cart])
                @cart_items = @cart.cart_items
                render :index
            else
                @cart_items = []
                render :index

                # @cart = Cart.create!
                # session[:cart] = @cart.id
                # @cart_items = @cart.cart_items
                # render :index
            end
        end
    end

    def show
       @cart_item = CartItem.find(params[:id])
       if @cart_item 
        render :show
       else
        render json: { cart_item: nil } 
       end
    end

    def create
        @cart_item = CartItem.create(cart_item_params)

        if @cart_item.save
            render :show
            # render json: {success: "Item successfully added to cart" }, status: :created
            # render :index
        else
            render json: {errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        if @cart_item.update(cart_item_params)
            render :show
        else
            render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        if @cart_item.destroy
            render json: { success: "Cart item successfully removed" }, status: :ok
        else
            render json: { errors: "Cart item could not be removed" }, status: :unprocessable_entity
        end
    end

    private
    
    def cart_item_params
        params.require(:cart_item).permit(:quantity, :cart_id, :product_id, :id)
    end

    # def set_cart
    #     if current_user
    #         @cart = current_user.cart
    #     else
    #         @cart = Cart.find(session[:cart]) if session[:cart]
    #     end
    # end

end
