require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { User.create!(name: "Test User", email: "test@example.com", password: "password") }

  describe "POST /posts" do
    it "creates a new post" do
      expect {
        post posts_path, params: { post: { title: "My Title", body: "My Body" } }
      }.to change(Post, :count).by(1)

      expect(response).to redirect_to(Post.last)
      follow_redirect!
      expect(response.body).to include("My Title")
    end
  end

  describe "PUT /posts/:id" do
    let!(:post_record) { Post.create!(title: "Old Title", body: "Old Body", user: user) }

    it "updates the post" do
      put post_path(post_record), params: { post: { title: "New Title" } }
      post_record.reload
      expect(post_record.title).to eq("New Title")
    end
  end
end

