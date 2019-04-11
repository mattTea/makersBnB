def create_user_and_sign_in
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
end
