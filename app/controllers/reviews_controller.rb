class ReviewsController < ApplicationController
	before_action :set_car

	def index
		@car = Car.find(params[:car_id])
		@reviews = @car.reviews
	end

	def new
		@car = Car.find(params[:car_id])
		@review = @car.reviews.new
	end

	def create
		@car = Car.find(params[:car_id])
		@review = @car.reviews.new(review_params)
		if @review.save
			redirect_to car_reviews_path(@car),
									notice: "Thanks for your review!"
		else
			render :new
		end
	end
end

def review_params
	params.require(:review).permit(:name, :comment)
end

def set_car
	@car = Car.find(params[:car_id])
end