require 'sign_in_helper'
require 'guest_user_sign_in_helper'

feature "Make request" do
  scenario "user request a space for a date" do
    create_user_and_sign_in

    click_button("Add space")
    fill_in('name', with: 'Hilton')
    fill_in('description', with: 'Fancy hotel')
    fill_in('price_per_night', with: 100)
    fill_in('start_date', with: '2019-04-04')
    fill_in('end_date', with: '2019-04-10')
    click_button('Add')

    click_button('Logout')

    guest_user_sign_in

    click_button('Request')
    fill_in("request_date", with: "2019-04-06")
    click_button("Confirm")

    click_button('Logout')

    visit "/"
    fill_in("login_username", with: "georgie")
    fill_in("login_password", with: "password123")
    click_button("Login")

    click_button("Review requests")
    expect(page).to have_content("Your requests")
    expect(page).to have_content("Hilton")
    expect(page).to have_content("2019-04-06")
  end
end
