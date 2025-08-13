require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: "Test User", email: "test@example.com", password: "password") }

  it 'is valid when associated with a user' do
    post = Post.new(user: user)
    expect(post.user).to eq(user)
  end

  it 'has many comments' do
    assoc = Post.reflect_on_association(:comments)
    expect(assoc.macro).to eq :has_many
  end
end
