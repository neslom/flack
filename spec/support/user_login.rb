def login_as(user)
  visit login_path

  fill_in "session[email]", with: user.email
  fill_in "session[password]", with: user.password

  click_link_or_button "Sign In"
end
