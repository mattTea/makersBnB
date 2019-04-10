feature "Authenticate User" do
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
    expect(page).to have_content("Welcome")
  end

  scenario "user sees error when incorrect password entered" do
    user = User.create(
      name: "George",
      username: "georgie",
      email: "georgie@com",
      password: "password123"
    )
    visit "/"
    fill_in("username", with: "georgie")
    fill_in("password", with: "password12345")
    click_button("Login")
    expect(page).to have_content "Please check your username and password"
  end
end
