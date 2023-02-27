class Api::OrderHistoryItemsController < ApplicationController

    def index
        if current_user
            @order_history_items = current_user.order_history_items
            render :index
        end
    end

    def show 
        @order_history_items = OrderHistoryItem.find(params[:id])
        if @order_history_items
            render :show
        else
            render json: { order_history_items: nil }
        end
    end

    def create 
        @order_history_item = OrderHistoryItem.create(order_history_item_params)

        if @order_history_item.save
            render :show
        else
            render json: {errors: @order_history_item.error.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def order_history_item_params
        params.require(:order_history_item).permit(:quantity, :user_id, :product_id, :order_total, :item_total, :order_confirmation, :id)
    end
end
