require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'find_by_credentials' do
    it 'finds a user by username and password' do
      user2 = User.create!(username: 'Woody', password: 'woody@woody.com')
      user1 = User.find_by_credentials('Woody', 'woody@woody.com')
      expect(user2).to eq(user1)
    end
  end

  describe 'reset session_token' do
    it 'session_token should not be same after reset' do
      user = User.create!(username: 'Woody', password: 'woody@woody.com')
      expect(user.session_token).not_to eq(user.reset_session_token!)
    end
  end
end
