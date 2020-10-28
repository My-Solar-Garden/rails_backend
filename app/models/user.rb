class User < ApplicationRecord
  validates :email, :provider, :token, presence: true
end
