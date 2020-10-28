require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valdations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :provider }
    it { should validate_presence_of :token }
  end

  describe 'relationships' do
    it { should have_many :user_gardens }
    it { should have_many(:gardens).through(:user_gardens) }
  end

  describe 'creation' do
    it 'can make a new user' do
      User.create!(email: 'test@gmail.com', provider: 'google', token: '1234')
      expect(User.count).to eq(1)
    end
  end
end