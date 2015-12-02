require "spec_helper"

describe "A car" do
	it "requires a title" do 
		car = Car.new(title: "")

		car.valid?

		expect(car.errors[:title].any?).to eq(true)
	end

	it "requires a description" do 
		car = Car.new(description: "")

		car.valid?

		expect(car.errors[:description].any?).to eq(true)
	end

	it "requires a description over 24 characters" do 
		car = Car.new(description: "X" * 24)

		car.valid?

		expect(car.errors[:description].any?).to eq(true)
	end

	it "requires a features" do 
		car = Car.new(features: "")

		car.valid?

		expect(car.errors[:features].any?).to eq(true)
	end

	it "requires a daily rate" do 
		car = Car.new(daily_rate: 0.00)

		car.valid?

		expect(car.errors[:daily_rate].any?).to eq(false)
	end

	it "accepts a positive daily rate" do 
		car = Car.new(daily_rate: 1800.00)

		car.valid?

		expect(car.errors[:daily_rate].any?).to eq(false)
	end

	it "rejects a negative daily rate" do 
		car = Car.new(daily_rate: -1800.00)

		car.valid?

		expect(car.errors[:daily_rate].any?).to eq(true)
	end

	it "accepts properly formatted image file names" do 
		file_names = %w[e.png car.png car.jpg car.gif CAR.GIF]
		file_names.each do |file_name|
			car = Car.new(image_file_name: file_name)
			car.valid?
			expect(car.errors[:image_file_name].any?).to eq(false)
		end
	end

	it "rejects improperly formatted image file names" do 
		file_names = %w[car .jpg .png .gif car.pdf car.doc]
		file_names.each do |file_name|
			car = Car.new(image_file_name: file_name)
			car.valid?
			expect(car.errors[:image_file_name].any?).to eq(true)
		end
	end

	it "is valid with example attributes" do 
		car = Car.new(car_attributes)

		expect(car.valid?).to eq(true)
	end

	it "has many reviews" do 
		car = Car.new(car_attributes)

		review1 = car.reviews.new(review_attributes)
		review2 = car.reviews.new(review_attributes)

		expect(car.reviews).to include(review1)
		expect(car.reviews).to include(review2)
	end

	it "deletes associated reviews" do 
		car = Car.create(car_attributes)

		car.reviews.create(review_attributes)

		expect {
			car.destroy
		}.to change(Review, :count).by(-1)
	end
end