 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/posts", type: :request do
  let!(:each) do
    @narrator = User.create(
      email: "vitor@example.com",
      password: "caplin123",
      name: "vitor",
      type: "Narrator"
    )
    @narrator.confirm

    @narrative = Narrative.create(
      title: "Título",
      description: "Lorem",
      size: 5,
      narrator: @narrator
    )
    Narrative.toggle_open

    @user = User.create(
      email: "joao@example.com",
      password: "caplin",
      name: "joao",
      narrative: @narrative
    )
    @user.confirm
    login_as @user
  end

  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { body: "corpo", allow: false, user: @user, narrative: @narrative }
  }

  let(:invalid_attributes) {
    { allow: false, user: @user, narrative: @narrative }
  }

  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Post.create! valid_attributes
  #     get narrative_posts_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /show" do
  #   it "renders a successful response" do
  #     post = Post.create! valid_attributes
  #     get narrative_posts_url(post)
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET /new" do
    it "renders a successful response" do
      get new_narrative_post_url(@narrative)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      post = Post.create! valid_attributes
      get edit_narrative_post_url(@narrative, post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post narrative_posts_url(@narrative), params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post's narrative" do
        post narrative_posts_url(@narrative), params: { post: valid_attributes }
        expect(response).to redirect_to(@narrative)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post narrative_posts_url(@narrative), params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post narrative_posts_url(@narrative), params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { body: "body", allow: true }
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        patch narrative_post_url(@narrative, post), params: { post: new_attributes }
        post.reload
        expect(post.allow).to eq(true)
      end

      it "redirects to the post's narrative" do
        post = Post.create! valid_attributes
        patch narrative_post_url(@narrative, post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(@narrative)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        post = Post.create! valid_attributes
        patch narrative_post_url(@narrative, post), params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete narrative_post_url(@narrative, post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the post's narrative" do
      post = Post.create! valid_attributes
      delete narrative_post_url(@narrative, post)
      expect(response).to redirect_to(@narrative)
    end
  end
end
