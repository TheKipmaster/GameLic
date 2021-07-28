feature "Choose narrative" do
  background do
    @user = User.create(
      email: "joao@example.com",
      password: "caplin",
      name: "joao"
    )
    @user.confirm
    login_as(@user, :scope => :user)

    @narrative = Narrative.create(
      title: "Título",
      description: "Lorem",
      size: 5,
    )
    Narrative.toggle_open
  end

  scenario "with student logged in" do
    visit "/narratives"
    click_link("Visualizar")
    click_link("Escolher essa narrativa")
    expect(page).to have_content @user.name
  end
end