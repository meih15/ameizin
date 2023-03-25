class Api::CartsController < ApplicationController


    def show
        debugger
        if current_user&.cart
            @cart = current_user.cart
            render :show
        else
            if cookies[:cart] && cookies[:cart] != ""
                debugger
                @cart = Cart.find(cookies[:cart])
                render :show
            else
                @cart = Cart.create!
                cookies[:cart] = @cart.id
                debugger
                render :show
            end
        end
    end


end
