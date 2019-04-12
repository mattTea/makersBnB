feature 'create new space' do
  scenario 'user can enter details and space is created' do
    create_user_and_sign_in
    click_button("Add space")
    fill_in('name', with: 'Hilton')
    fill_in('description', with: 'Fancy hotel')
    fill_in('price_per_night', with: 100)
    fill_in('start_date', with: '2019-04-04')
    fill_in('end_date', with: '2019-04-10')
    click_button('Add')
    expect(page).to have_content('Hilton')
    expect(page).to have_content('Fancy hotel')
    expect(page).to have_content('$100.00')
    expect(page).to have_content('4 April 2019')
    expect(page).to have_content('10 April 2019')
  end

  scenario 'link user id to space when creating new space' do
    create_user_and_sign_in
    click_button("Add space")
    fill_in('name', with: 'Hilton')
    fill_in('description', with: 'Fancy hotel')
    fill_in('price_per_night', with: 100)
    fill_in('start_date', with: '2019-04-04')
    fill_in('end_date', with: '2019-04-10')
    click_button('Add')
    expect(page).to have_content 'Host'
    expect(page).to have_content 'georgie'
  end
end
