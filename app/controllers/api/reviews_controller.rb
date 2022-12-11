class Api::ReviewsController < ApplicationController
    def create
      @review = Review.new(review_params)
      if @review.save
          render "/api/reviews/show"
      else
          render json: { errors: @review.errors.full_messages }, status: 422
      end
    end

    def index
        @reviews = Review.all
        render "/api/reviews/index"
    end

    def show
        @review = Review.find_by(id: params[:id])
        render "/api/reviews/show"
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
          render "/api/reviews/show"
        else
          render json: { errors: @review.errors.full_messages }, status: 422
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        if @review && @review.destroy
          render json: ["#{@review.id} has been deleted"]
        else
          render json: ["Review not found or can't be deleted!"], status: 404
        end
    end

    private
    def review_params
        params.require(:review).permit(:product_id, :reviewer_id, :comment, :rating)
    end
end
