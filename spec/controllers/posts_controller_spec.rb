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
    let(:posts) { create(:post) }

    it "assigns the post to the inst variable @post[:id]" do
      get :show, id: post.to_param
      expect(assigns(:post)).to eq post
    end

  end

end
