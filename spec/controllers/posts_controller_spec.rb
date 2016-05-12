require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    let(:posts) { create_list(:post, 3) }

    it "assigns all posts to @posts" do
      get :index
      expect(assigns(:posts)).to eq posts
    end
  end

  describe "GET #show" do
    let(:post) { create(:post) }

    it "assigns the post to the inst variable @post[:id]" do
      get :show, id: post.to_param
      expect(assigns(:post)).to eq post
    end
  end

  describe "GET #new" do
      it "assigns new post as the inst variable @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    let(:post) { create(:post) }

    it "assigns the selected post to the instance var @post" do
        get :edit, id: post.to_param
    end
  end

  describe "POST #create" do
    context "validate params" do
      let(:valid_params) { { post: { title: "title", subheader: "subheader", content: "content" } } }

      it "creates new post" do
        expect{ post :create, valid_params }.to change{ Post.count }.by(1)
      end

      it "assigns the new post to the inst variable @post" do
        post :create, valid_params
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the show page for the new @post" do
        post :create, valid_params
        expect(response).to redirect_to(Post.last)
      end
    end

    context "invalid params" do
      let(:invalid_params) { { post: { title: nil, subheader: "subheader", content: "content" } } }

      it "assigns new, unsave post to the inst variable @post" do
        post :create, invalid_params
        expect(assigns(:post)).to be_a(Post)
      end

      it "renders new page" do
        post :create, invalid_params
        expect(response).to render_template{ "new" }
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the selected post" do
      post = create(:post)

      expect{ delete :destroy, id: post.to_param }.to change{ Post.count }.by(-1)
      expect(response).to redirect_to posts_url
    end
  end

end
