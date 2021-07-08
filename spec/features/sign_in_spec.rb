feature "Signing in" do
  background do
    User.create(email: "user@example.com", password: "caplin")
  end

  scenario "Signing in with correct credentials" do
    visit "/users/sign_in"
    within("form.new_user") do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "caplin"
    end
    click_button "Log in"
    expect(page).to have_content "Signed in successfully"
  end

  given(:other_user) { User.create(email: "other@example.com", password: "rous") }

  scenario "Signing in as another user" do
    visit "/users/sign_in"
    within("form.new_user") do
      fill_in "Email", with: other_user.email
      fill_in "Password", with: other_user.password
    end
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password"
  end
end