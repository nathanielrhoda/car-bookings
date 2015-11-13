require "spec_helper"

describe "Edits a car " do 
	it "updates the car and shows the details" do 
		car = Car.create(car_attributes)

		visit car_url(car)

		click_link 'Edit'

		expect(current_path).to eq(edit_car_path(car))
		expect(find_field("Title").value).to eq(car.title)
	end
end