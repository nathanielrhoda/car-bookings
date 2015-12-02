class Review < ActiveRecord::Base
	validates :name,  presence: true
	validates :comment, length: {minimum: 3}, presence: true
  belongs_to :car
end
