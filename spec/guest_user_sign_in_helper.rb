def guest_user_sign_in
  guest_user = User.create(
    name: "Evelyn",
    username: "evelyn",
    email: "evelyn@com",
    password: "password1"
  )
  visit "/"
  fill_in("login_username", with: "georgie")
  fill_in("login_password", with: "password123")
  click_button("Login")
end
