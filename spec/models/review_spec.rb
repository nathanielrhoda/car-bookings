require 'spec_helper'

describe "A review" do 

	it "belongs to a car" do 
		car = Car.create(car_attributes)

		review = car.reviews.new(review_attributes)

		expect(review.car).to eq(car)
	end

	it "with example attributes is valid" do 
		review = Review.new(review_attributes)

		expect(review.valid?).to eq(true)
	end

	it "requires a name" do 
		review = Review.new(name: "")

		review.valid?

		expect(review.errors[:name].any?).to eq(true)
	end

	it "requires a comment" do 
		review = Review.new(comment: "")

		review.valid?

		expect(review.errors[:comment].any?).to eq(true)
	end

	it "requires a comment over 3 characters" do 
		review = Review.new(comment: "X" * 3)

		review.valid?

		expect(review.errors[:comment].any?).to eq(false)
	end
end
