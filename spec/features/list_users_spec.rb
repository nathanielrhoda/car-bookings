require "spec_helper"

describe "Viewing the list of users" do 

	it "shows the users" do 
		user1 = User.create!(user_attributes(name: "Peter", email: "petersolomons@gmail.com"))

		visit users_url

		expect(page).to have_link(user1.name)
	end
end