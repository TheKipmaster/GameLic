feature "Signing up" do
  # background do
  #   User.create()
  # end

  scenario "Signing up with unused credentials" do
    visit "users/sign_up"
    within("form.new_user") do
      fill_in "Nome", with: "Ricardo Souza"
      fill_in "Instituição", with: "UFG"
      fill_in "Matrícula", with: "16/20481"
      fill_in "Apelido", with: "Rick"
      fill_in "Idade", with: "23"
      fill_in "E-mail", with: "ricardo@ufg.com.br"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"
    end
    click_button "Sign up"
    expect(page).to have_content "You have signed up successfully"
  end
end