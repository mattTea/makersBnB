require 'sign_in_helper'
require 'guest_user_sign_in_helper'

feature "Make request" do
  scenario "user request a space for a date" do
    # create a host user
    create_user_and_sign_in

    # create a space
    click_button("Add space")
    fill_in('name', with: 'Hilton')
    fill_in('description', with: 'Fancy hotel')
    fill_in('price_per_night', with: 100)
    fill_in('start_date', with: '2019-04-04')
    fill_in('end_date', with: '2019-04-10')
    click_button('Add')

    click_button('Logout')

    # create guest user
    guest_user_sign_in
    # make request
    click_button('Request')
    fill_in("request_date", with: "2019-04-06")
    click_button("Request")

    # expect confirmation of request
    expect(page).to have_content "Thanks for your request"
  end
end
