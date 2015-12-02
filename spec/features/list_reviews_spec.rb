require "spec_helper"

describe "Viewing a list of reviews" do 

	it "shows the reviews for a specific car" do 
		car1 = Car.create(car_attributes(title: "Crystler Hemi Sport"))
		review1 = car1.reviews.create(review_attributes(name: "Crystler Hemi Sport"))
		review2 = car1.reviews.create(review_attributes(name: "Crystler Hemi Sport"))

		car2 = Car.create(car_attributes(title: "Hummer H3"))
		review3 = car2.reviews.create(review_attributes(name: "Hummer H3"))

		visit car_reviews_url(car1)

		expect(page).to have_text(review1.name)
		expect(page).to have_text(review2.name)
		expect(page).not_to have_text(review3.name)
	end
end