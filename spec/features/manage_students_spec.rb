require 'rails_helper'

feature "Manage Students" do
  let!(:each) do
    @narrator = User.create(
      email: "ronaldo@example.com",
      password: "caplin123",
      name: "ronaldo",
      type: "Narrator"
    )
    @narrator.confirm

    @user = User.create(
      email: "dorian@example.com",
      password: "caplin",
      name: "dorian"
    )
    @user.confirm

    @narrative = Narrative.create(
      title: "Verdade",
      description: "Lorem",
      size: 5,
      narrator: @narrator
    )
    Narrative.toggle_open
  end

  scenario "with student logged in" do
    login_as @user
    visit "/users"
    expect(page).to have_content "Acesso não autorizado"
  end

  scenario "with narrator logged in" do
    login_as @narrator
    visit "/users"

    within("##{@user.name}-#{@user.id}") do
      select @narrative.title, from: "user[narrative_id]"
      click_on(class: "btn-salvar")

      expect(page).to have_css("select#user_narrative_id", :text => @narrative.title)
    end
  end
end