feature 'create new space' do
  scenario 'user can enter details and space is created' do
    user = User.create(
      name: "George",
      username: "georgie",
      email: "georgie@com",
      password: "password123"
    )
    visit "/"
    fill_in("login_username", with: "georgie")
    fill_in("login_password", with: "password123")
    click_button("Login")
    click_button("Add space")
    fill_in('name', with: 'Hilton')
    fill_in('description', with: 'Fancy hotel')
    fill_in('price_per_night', with: 100)
    fill_in('start_date', with: '2019-04-04')
    fill_in('end_date', with: '2019-04-10')
    click_button('Add')
    expect(page).to have_content('Name: Hilton')
    expect(page).to have_content('Description: Fancy hotel')
    expect(page).to have_content('Price per night: $100.00')
    expect(page).to have_content('Available from: 4 April 2019')
    expect(page).to have_content('Available until: 10 April 2019')
  end

  scenario 'link user id to space when creating new space' do
    user = User.create(
      name: "George",
      username: "georgie",
      email: "georgie@com",
      password: "password123"
    )
    visit "/"
    fill_in("login_username", with: "georgie")
    fill_in("login_password", with: "password123")
    click_button("Login")
    click_button("Add space")
    fill_in('name', with: 'Hilton')
    fill_in('description', with: 'Fancy hotel')
    fill_in('price_per_night', with: 100)
    fill_in('start_date', with: '2019-04-04')
    fill_in('end_date', with: '2019-04-10')
    click_button('Add')
    expect(page).to have_content 'Host: georgie'
  end
end
