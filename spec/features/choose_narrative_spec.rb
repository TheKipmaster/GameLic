feature "Choose narrative" do
  background do
    @narrator = User.create(
      email: "vitor@example.com",
      password: "caplin123",
      name: "vitor",
      type: "Narrator"
    )
    @narrator.confirm

    @user = User.create(
      email: "joao@example.com",
      password: "caplin",
      name: "joao"
    )
    @user.confirm
    login_as @user

    @narrative = Narrative.create(
      title: "Título",
      description: "Lorem",
      size: 5,
      narrator: @narrator
    )
    Narrative.toggle_open
  end

  scenario "with student logged in" do
    visit "/narratives"
    click_link(@narrative.title) # @TODO: @narrative.title
    click_link("Inscrever-se na mesa")
    expect(page).to have_content @user.name
  end
end