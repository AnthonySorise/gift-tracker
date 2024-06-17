require 'rails_helper'

RSpec.feature "Gift management", type: :feature do
    let!(:friend) { Friend.create(name: "John Doe", birthday: "1990-01-01") }

    scenario "Gift name validation" do
        visit new_friend_gift_path(friend)

        fill_in "Description", with: ""
        click_button "Create Gift"

        expect(page).to have_content("Description can't be blank")
    end
end