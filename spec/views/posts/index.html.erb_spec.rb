require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  let(:posts) { create_list(:post, 3) }
  before do
    assign(:posts, posts)
    render
  end

  it "shows a title" do
    assert_select "h1", text: "List of Posts", count: 1
  end

  it "renders all the posts" do
    assert_select "div.post", count: posts.count

    posts.each do |post|
      assert_select "h3", text: post.title, count: 1
      assert_select "h4", text: post.subheader, count: 1
    end
  end

end
