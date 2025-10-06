require 'rails_helper'

RSpec.describe "Comments Authentication", type: :request do
  let(:user) { User.create!(name: "Test User", email: "test@example.com", password: "password") }
  let!(:post_record) { Post.create!(title: "Title", body: "Body", user: user) }
  let!(:comment) { Comment.create!(body: "A comment", post: post_record, user: user) }

  describe "POST /posts/:post_id/comments" do
    it "returns 403 if not logged in" do
      post post_comments_path(post_record), params: { comment: { body: "Test comment" } }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "DELETE /comments/:id" do
    it "returns 403 if not logged in" do
      delete comment_path(comment)
      expect(response).to have_http_status(:forbidden)
    end
  end
end
