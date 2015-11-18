require "spec_helper"

describe "Creating a new car" do 
	it "saves the car and shows the new car's details" do 
		visit cars_url

		click_link 'Add New Car'

		expect(current_path).to eq(new_car_path)

		fill_in "Title", with: "Crystler Hemi Sport"
		fill_in "Features", with: "Has Black Leather Seats and a music system"
		fill_in "Description", with: "Suitable for any occasion eg. Matric Dance, Weddings ect."
		fill_in "Daily rate", with: "1800.00"

		click_button 'Create Car'

		expect(current_path).to eq(car_path(Car.last))
		expect(page).to have_text('Crystler Hemi Sport')
	end
end