class Api::CartItemsController < ApplicationController
    before_action :set_cart

    def index
        @cart_items = @cart.cart_items
        render :index
    end

    def show
       @cart_item = @cart.cart_items.find(params[:id])
       if @cart_item 
        render :show
       else
        render json: { cart_item: nil } 
       end
    end

    def create
        @product = Product.find(params[:product_id])
        @cart_item = @cart.cart_items.create(quantity: params[:quantity], product: @product)

        if @cart_item.save
            render :show
            # render json: {success: "Item successfully added to cart" }, status: :created
            # render :index
        else
            render json: {errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @cart_item = @cart.cart_items.find(params[:id])
        if @cart_item.update(cart_item_params)
            render :show
        else
            render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @cart_item = @cart.cart_items.find(params[:id])
        if @cart_item.destroy
            render json: { success: "Cart item successfully removed" }, status: :ok
        else
            render json: { errors: "Cart item could not be removed" }, status: :unprocessable_entity
        end
    end

    private
    
    def cart_item_params
        params.require(:cart_item).permit(:quantity)
    end

    def set_cart
        if current_user
            @cart = current_user.cart
        else
            @cart = Cart.find(session[:cart]) if session[:cart]
        end
    end

end
