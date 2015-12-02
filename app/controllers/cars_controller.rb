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
		if @car.update(car_params)
			redirect_to @car, notice: "Car successfully updated!"
		else
			render :edit
		end
	end

	def create
		@car = Car.new(car_params)
		if @car.save
			redirect_to @car, notice: "Car successfully created!"
		else
			render :new
		end
	end
	
	def new
		@car = Car.new
	end

	def destroy
		@car = Car.find(params[:id])
		@car.destroy
		redirect_to cars_url, alert: "Car successfully deleted!"
	end

	def car_params
		params.require(:car).permit(:title, :description, :features, :daily_rate, )
	end

private
	def car_params
		params.require(:car).permit(:title, :description, :features, :daily_rate, :image_file_name)
	end

	def set_car
		@car = Car.find(params[:car_id])
	end
end

