require "spec_helper"

describe "Navigating cars" do
	it "allows navigation from the detail page to the listing cars page" do 
		car = Car.create(car_attributes)

		visit car_url(car)

		click_link "All Cars"

		expect(current_path).to eq(cars_path)
	end

	it "allows navigation from the listing page to the detail page" do
		car = Car.create(car_attributes)

		visit cars_url

		click_link car.title

		expect(current_path).to eq(car_path(car))
	end
end

