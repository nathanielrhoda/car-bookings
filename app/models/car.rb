class Car < ActiveRecord::Base
	validates :title, :features, presence: true
	validates :description, length: { minimum: 25 }
	validates :daily_rate, numericality: { greater_than_or_equal_to: 0 }  

	validates :image_file_name, allow_blank: true, format: {
		with: /\w+\.(gif|jpg|png)\z/i,
		message: "must reference a GIF, JPG, or PNG image"
	}
end
