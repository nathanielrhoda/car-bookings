require 'spec_helper'

describe "Viewing the list of cars" do 

	it "shows the list" do 
		car1 = Car.create(title: "Crystler Hemi Sport",
											features: "Has Black Leather Seats and a music system",
											description: "Suitable for any occasion eg. Matric Dance, Weddings ect.",
											daily_rate: 1800.00)

		car2 = Car.create(title: "Hummer H3",
											features: "Has Black Leather Interia and music system",
											description: "Suitable for any occasion eg. Matric Dance, Weddings ect.",
											daily_rate: 1800.00)


		car3 = Car.create(title: "BMW Sport",
											features: "Has Black Leather Interia and music system",
											description: "Suitable for any occasion eg. Matric Dance, Weddings ect.",
											daily_rate: 1800.00)

		car4 = Car.create(title: "Limousine",
											features: "Has Black Leather Interia and music system, Mini-bar, smoke machine and strobe lights",
											description: "10 Seater, Suitable for any occasion eg. Matric Dance, Weddings ect.",
											daily_rate: 1600.00)

		visit cars_url

		expect(page).to have_text("4 Cars")
		expect(page).to have_text(car1.title)
		expect(page).to have_text(car2.title)
		expect(page).to have_text(car3.title)
		expect(page).to have_text(car4.title)
	end
end