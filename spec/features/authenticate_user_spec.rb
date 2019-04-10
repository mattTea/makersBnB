xfeature "Authenticate User" do
  scenario "user can login to pink BnB" do
    user = User.create(
      name: "George",
      username: "georgie",
      email: "georgie@com",
      password: "password123"
    )
    visit "/"
    fill_in("username", with: "georgie")
    fill_in("password", with: "password123")
    click_button("Login")
    expect(page).to have_content("Welcome back")
  end
end
