class Bid < ApplicationRecord
  belongs_to :bidder, class_name: 'User'
  belongs_to :auction, inverse_of: :bids

  validates_presence_of :bidder
end
