require 'test_helper'

class NarrativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @narrative = narratives(:one)
  end

  test "should get index" do
    get narratives_url
    assert_response :success
  end

  test "should get new" do
    get new_narrative_url
    assert_response :success
  end

  test "should create narrative" do
    assert_difference('Narrative.count') do
      post narratives_url, params: { narrative: { author: @narrative.author, story: @narrative.story, title: @narrative.title } }
    end

    assert_redirected_to narrative_url(Narrative.last)
  end

  test "should show narrative" do
    get narrative_url(@narrative)
    assert_response :success
  end

  test "should get edit" do
    get edit_narrative_url(@narrative)
    assert_response :success
  end

  test "should update narrative" do
    patch narrative_url(@narrative), params: { narrative: { author: @narrative.author, story: @narrative.story, title: @narrative.title } }
    assert_redirected_to narrative_url(@narrative)
  end

  test "should destroy narrative" do
    assert_difference('Narrative.count', -1) do
      delete narrative_url(@narrative)
    end

    assert_redirected_to narratives_url
  end
end
