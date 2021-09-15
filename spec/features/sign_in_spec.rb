feature "Signing in" do
  background do
    @user = User.create(email: "user@example.com", password: "caplin")
  end

  scenario "with unconfirmed user" do
    visit "/users/sign_in"
    within("form.new_user") do
      fill_in "Email", with: @user.email
      fill_in "Senha", with: @user.password
    end

    click_button "Entrar"
    expect(page).to have_content "You have to confirm your email address before continuing"
  end

  # scenario "with confirmed user" do
  #   visit "/users/sign_in"
  #   within("form.new_user") do
  #     fill_in "Email", with: "user@example.com"
  #     fill_in "Senha", with: "caplin"
  #   end
  #   click_button "Entrar"
  #   expect(page).to have_content "Signed in successfully"
  # end

  given(:other_user) { User.create(email: "other@example.com", password: "rous") }

  scenario "as unregistered user" do
    visit "/users/sign_in"
    within("form.new_user") do
      fill_in "Email", with: other_user.email
      fill_in "Senha", with: other_user.password
    end
    click_button "Entrar"
    expect(page).to have_content "Invalid Email or password"
  end
end