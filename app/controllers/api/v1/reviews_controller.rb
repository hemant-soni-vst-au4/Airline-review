module Api     
    module V1
        class ReviewsController < ApplicationController
        
            def create
                reviews =Review.new(review_params)

                if reviews.save
                    render json: ReviewSerializer.new(reviews).serialized_json
                else
                    render json: { error: review.errors.messages }, status: 422
                end
            end

            def destroy
                reviews =Review.find_by(params[:id])

                if reviews.destroy
                    head :no_content
                else
                    render json: { error: review.errors.messages }, status: 422
                end
            end
           
            private

            def review_params
            params.require(:review).permit(:title, :description, :score, :airline_id)
            end
        end
    end
end