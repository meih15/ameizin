class Api::CartsController < ApplicationController
    def current_cart
        
    end

    def index

    end

    def create

    end

    def updated

    end

    def destroy

    end


    private

    def cart_params 
        params.require(:cart).permit(:product_id, :user_id, :quantity)
    end
end
