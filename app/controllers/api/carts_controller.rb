class Api::CartsController < ApplicationController


    def show

        if current_user&.cart
            @cart = current_user.cart
            render :show
        else
            if cookies[:cart] && cookies[:cart] != ""
                @cart = Cart.find(cookies[:cart])
                render :show
            else
                @cart = Cart.create!
                cookies[:cart] = @cart.id

                render :show
            end
        end
    end


end
