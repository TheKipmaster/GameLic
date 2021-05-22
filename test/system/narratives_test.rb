require "application_system_test_case"

class NarrativesTest < ApplicationSystemTestCase
  setup do
    @narrative = narratives(:one)
  end

  test "visiting the index" do
    visit narratives_url
    assert_selector "h1", text: "Narratives"
  end

  test "creating a Narrative" do
    visit narratives_url
    click_on "New Narrative"

    fill_in "Author", with: @narrative.author
    fill_in "Story", with: @narrative.story
    fill_in "Title", with: @narrative.title
    click_on "Create Narrative"

    assert_text "Narrative was successfully created"
    click_on "Back"
  end

  test "updating a Narrative" do
    visit narratives_url
    click_on "Edit", match: :first

    fill_in "Author", with: @narrative.author
    fill_in "Story", with: @narrative.story
    fill_in "Title", with: @narrative.title
    click_on "Update Narrative"

    assert_text "Narrative was successfully updated"
    click_on "Back"
  end

  test "destroying a Narrative" do
    visit narratives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Narrative was successfully destroyed"
  end
end
