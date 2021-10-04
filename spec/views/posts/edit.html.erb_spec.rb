require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @user = User.create(
      email: "joao@example.com",
      password: "caplin",
      name: "joao"
    )
    @user.confirm

    @post = assign(:post, Post.create!(
      body: "MyText",
      allow: true,
      user: @user
    ))

    @narrative = Narrative.create(
      title: "Título",
      description: "Lorem",
      size: 5,
      narrator: @narrator
    )
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", narrative_post_path(@narrative, @post), "post" do

      assert_select "textarea[name=?]", "post[body]"

      assert_select "input[name=?]", "post[allow]"
    end
  end
end
