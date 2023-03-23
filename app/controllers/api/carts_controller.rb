class Api::CartsController < ApplicationController


    def show
        if current_user&.cart
            @cart = current_user.cart
            render :show
        else
            if session[:cart] 
                @cart = Cart.find(session[:cart])
                render :show
            else
                @cart = Cart.create!
                session[:cart] = @cart.id
                render :show
            end
        end
    end


end
