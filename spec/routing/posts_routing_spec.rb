require 'rails_helper'

RSpec.describe PostsController, type: :routing do
  describe "GET /" do
    it "routes to posts#index" do
      expect(get: "/").to route_to("posts#index")
    end
  end

  describe "GET /posts/:post_id" do
    it "routes to post#show" do
      expect(get: "/posts/1").to route_to("posts#show", id: "1")
    end
  end

  describe "GET /posts/new" do
    it "routes to posts#new" do
      expect(get: "/posts/new").to route_to("posts#new")
    end
  end

  describe "GET /posts/:post_id/edit" do
    it "routes to post#edit" do
      expect(get: "/posts/15/edit").to route_to("posts#edit", id: "15")
    end
  end

  describe "POST /posts" do
    it "routes to posts#create" do
      expect(post: "/posts/").to route_to("posts#create")
    end
  end

  describe "PUT /posts/:post_id" do
    it "routes to posts#update" do
      expect(put: "posts/2").to route_to("posts#update", id: "2")
    end
  end

  describe "DELETE /posts/:post_id" do
    it "routes to posts#delete" do
      expect(delete: "/posts/3").to route_to("posts#destroy", id: "3")
    end
  end

end
