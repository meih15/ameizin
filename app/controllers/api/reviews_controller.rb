class Api::ReviewsController < ApplicationController

    def index
        @reviews = Review.all
        render :index
    end

    def show
        @review = OrderHistoryItem.find(params[:id])
        if @review
            render :show
        else
            render json: { review: nil }
        end        
    end

    def create
        @review = Review.create(review_params)

        if @review.save
            render :show
        else
            render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
        end
    end        


    def destroy
        @review = Review.find(params[:id])
        if @review.destroy
            render json: { success: "Review successfully removed" }, status: :ok        
        else
            render json: {errors: 'Review could not be removed'}, status: :unprocessable_entity
        end
    end   

    private

    def review_params
        params.require(:review).permit(:user_id, :product_id, :rating, :headline, :comment, :id)
    end

end
