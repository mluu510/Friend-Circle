class AddCircleNameToFriendCircle < ActiveRecord::Migration
  def change
    add_column :friend_circles, :name, :string
  end
end
