class AddUserIdToAuctions < ActiveRecord::Migration[7.0]
  def change
    add_column :auctions, :user_id, :integer
  end
end
