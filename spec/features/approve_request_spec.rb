require 'sign_in_helper'

feature "Make request" do
  scenario "user request a space for a date" do
    create_user_and_sign_in
    click_button("Review requests")
    expect(page).to have_content("Your requests")
  end
end
