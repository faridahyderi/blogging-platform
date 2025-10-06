require 'rails_helper'

RSpec.describe "Dashboard Authentication", type: :request do
  let(:user) { User.create!(name: "Test User", email: "test@example.com", password: "password") }
  let!(:post_record) { Post.create!(title: "Title", body: "Body", user: user) }

  describe "GET /dashboard" do
    it "returns 403 if not logged in" do
      get "/dashboard"
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "DELETE /dashboard/:id" do
    it "returns 403 if not logged in" do
      delete "/dashboard/#{post_record.id}"
      expect(response).to have_http_status(:forbidden)
    end
  end
end
