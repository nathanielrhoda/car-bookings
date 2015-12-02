def car_attributes(overrides = {})
	{
		title: "Crystler Hemi Sport",
		description: "Arrive in Style with the new beautiful Crystler",
		features: "Black Leather Interia and a music system",
		daily_rate: 1800.00,
		image_file_name: "crystler 1.jpg"
	}.merge(overrides)
end

def review_attributes(overrides = {})
	{
		name: "Crystler Hemi Sport",
		comment: "I would recommend this company to all my friends"
	}.merge(overrides)
end