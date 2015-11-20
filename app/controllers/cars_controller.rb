class CarsController < ApplicationController

	def index
		@cars = Car.all
	end

	def show
		@car = Car.find(params[:id])
	end

	def edit
		@car = Car.find(params[:id])
	end

	def update
		@car = Car.find(params[:id])
		car_params = params.require(:car).permit(:title, :description, :features, :daily_rate)
		@car.update(car_params)
		redirect_to @car
	end

	def create
		car_params = params.require(:car).permit(:title, :description, :features, :daily_rate)
		@car = Car.new(car_params)
		@car.save
		redirect_to @car
	end
	
	def new
		@car = Car.new
	end

	def destroy
		@car = Car.find(params[:id])
		@car.destroy
		redirect_to cars_url
	end

	def car_params
		params.require(:car).permit(:title, :description, :features, :daily_rate, )
	end

private
	def car_params
		params.require(:car).permit(:title, :description, :features, :daily_rate, :image_file_name)
	end
end

