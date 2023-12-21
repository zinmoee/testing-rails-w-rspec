class User < ApplicationRecord
  has_many :auctions, inverse_of: :user
  validates_presence_of :password, :email
end
