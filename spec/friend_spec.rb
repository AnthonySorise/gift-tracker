require 'rails_helper'

RSpec.feature "Friend management", type: :feature do
    scenario "Friend name validation" do
        visit new_friend_path

        fill_in "Name", with: ""
        click_button "Create Friend"

        expect(page).to have_content("Name can't be blank")
    end
end