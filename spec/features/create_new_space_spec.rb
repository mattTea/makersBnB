feature 'create new space' do
  scenario 'user can enter details and space is created' do
    visit('/space')
    fill_in('name', with: 'Hilton')
    fill_in('description', with: 'Fancy hotel')
    fill_in('price_per_night', with: 100)
    click_button('Add')
    expect(page).to have_content('Name: Hilton')
    expect(page).to have_content('Description: Fancy hotel')
    expect(page).to have_content('Price per night: $100.00')
  end
end
