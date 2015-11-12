require "spec_helper"

describe "Viewing a single car" do

	it "shows the cars details" do
		car = Car.create(title: "Crystler Hemi Sport",
										description: "Arrive in Style",
										features: "Black Leather Interia and a music system",
										daily_rate: 1800.00)

		visit car_url(car)

		expect(page).to have_text(car.title)
		expect(page).to have_text(car.description)
		expect(page).to have_text("R1,800.00")
		expect(page).to have_text(car.features)
	end
end