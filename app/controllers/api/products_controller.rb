class Api::ProductsController < ApplicationController
    def index
       @products = Product.all
       render :index
    end

    def show
        @product = Product.find_by(id: params[:id])
        if @product
            render :show
        else
            render json: { product: nil } 
        end
    end

    def update
        @product = Product.find_by(id: params[:id])
        if @product.update(product_params)
            render :show
        else
            render json: { product: nil}
        end
    end

    private
    def product_params
        puts params.inspect
        params.require(:product).permit(:product_name, :description, :bullets, :price, :inventory, :category_id, :id)
    end
end
