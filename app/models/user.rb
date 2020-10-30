class User < ApplicationRecord
  validates :email, :provider, :token, :uid, presence: true

  has_many :user_gardens
  has_many :gardens, through: :user_gardens

  def self.exist?(id)
    find(id) rescue false
  end
end
