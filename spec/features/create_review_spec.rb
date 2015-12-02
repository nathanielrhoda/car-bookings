require "spec_helper"

describe "Creating a new review" do 
	it "saves the review" do 
		car = Car.create(car_attributes)

		visit car_url(car)

		click_link 'Write Review'

		expect(current_path).to eq(new_car_review_path(car))

		fill_in "Name", with: "Crystler Hemi Sport"
		fill_in "Comment", with: "I liked the car very much. Its very classy and the driver was very friendly"

		click_button 'Post Review'

		expect(current_path).to eq(car_reviews_path(car))
		expect(page).to have_text("Thanks for your review!")
	end

	it "does not save the review if it's invalid" do 
		car = Car.create(car_attributes)

		visit new_car_review_url(car)

		expect {
			click_button 'Post Review'
		}.not_to change(Review, :count)

		expect(page).to have_text('error')
	end
end