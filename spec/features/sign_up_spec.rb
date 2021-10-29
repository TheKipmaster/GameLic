require 'rails_helper'

feature "Signing up" do
  # background do
  #   User.create()
  # end

  scenario "with unused credentials" do
    visit "users/sign_up"
    within("form.new_user") do
      # fill_in "Nome", with: "Ricardo Souza"
      # fill_in "Instituição", with: "UFG"
      # fill_in "Matrícula", with: "16/20481"
      # fill_in "Apelido", with: "Rick"
      # fill_in "Idade", with: "23"
      fill_in "E-mail", with: "ricardo@ufg.com.br"
      fill_in "Senha", with: "123456"
      fill_in "Confirmar Senha", with: "123456"
    end
    click_button "Cadastrar"
    expect(page).to have_content "Por favor confirme sua conta antes de continuar."
  end
end