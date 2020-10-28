class User < ApplicationRecord
  validates :email, :provider, :token, presence: true

  has_many :user_gardens
  has_many :gardens, through: :user_gardens
end