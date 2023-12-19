class User < ApplicationRecord
  has_many :acution, inverse_of: :user
  validates_presence_of :password, :email
end
