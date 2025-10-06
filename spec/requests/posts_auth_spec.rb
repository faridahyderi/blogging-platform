require 'rails_helper'

RSpec.describe "Posts Authentication", type: :request do
  describe "POST /posts" do
    it "returns 403 if not logged in" do
      post "/posts", params: { post: { title: "Test", body: "Body" } }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "PUT /posts/:id" do
    let(:user) { User.create!(name: "Test User", email: "test@example.com", password: "password") }
    let!(:post_record) { Post.create!(title: "Old Title", body: "Old Body", user: user) }

    it "returns 403 if not logged in" do
      put post_path(post_record), params: { post: { title: "New Title" } }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "DELETE /posts/:id" do
    let(:user) { User.create!(name: "Test User", email: "test@example.com", password: "password") }
    let!(:post_record) { Post.create!(title: "Title", body: "Body", user: user) }

    it "returns 403 if not logged in" do
      delete post_path(post_record)
      expect(response).to have_http_status(:forbidden)
    end
  end
end
