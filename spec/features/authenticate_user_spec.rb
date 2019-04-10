feature "Authenticate User" do
  scenario "user can login to pink BnB" do
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
    expect(page).to have_content("Where do you want to stay, George?")
  end

  scenario "user sees error when incorrect password entered" do
    user = User.create(
      name: "George",
      username: "georgie",
      email: "georgie@com",
      password: "password123"
    )
    visit "/"
    fill_in("login_username", with: "georgie")
    fill_in("login_password", with: "password12345")
    click_button("Login")
    expect(page).to have_content "Please check your username and password"
  end

  scenario "user can log out of Pink BnB" do
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
    click_button("Logout")
    expect(page).to have_content "See you next time"
  end
end
