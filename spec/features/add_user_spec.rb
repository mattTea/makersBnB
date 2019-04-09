describe('Feature') do
  it('captures user details') do
    visit('/users/new')
    fill_in('name', with: 'Person1')
    fill_in('username', with: 'person1')
    fill_in('email', with: 'person1@test.com')
    fill_in('password', with: 'password1')
    click_button('Submit')

    expect(page).to have_content 'Person1'
  end
end
