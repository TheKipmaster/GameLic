require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
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

    assign(:post, Post.new(
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

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", narrative_posts_path(@narrative), "post" do

      assert_select "textarea[name=?]", "post[body]"

      assert_select "input[name=?]", "post[allow]"
    end
  end
end
