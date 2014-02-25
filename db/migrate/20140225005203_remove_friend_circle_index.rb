class RemoveFriendCircleIndex < ActiveRecord::Migration
  def change
    remove_index :friend_circles, column: :owner_id
    add_index :friend_circles, :owner_id
  end
end
