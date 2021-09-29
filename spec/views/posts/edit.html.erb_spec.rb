require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      body: "MyText",
      allow: ""
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "textarea[name=?]", "post[body]"

      assert_select "input[name=?]", "post[allow]"
    end
  end
end
