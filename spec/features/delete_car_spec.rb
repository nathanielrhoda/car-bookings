require 'spec_helper'

describe "Deleting a car" do 
	it "destroys the car and shows the car list without the deleted car" do 
		car = Car.create(car_attributes)

		visit car_path(car)

		click_link 'Delete'

		expect(current_path).to eq(cars_path)
		expect(page).not_to have_text(car.title)

		expect(page).to have_text("Car successfully deleted!")
	end
end