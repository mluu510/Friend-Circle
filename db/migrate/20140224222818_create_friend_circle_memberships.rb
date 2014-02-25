class CreateFriendCircleMemberships < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :friend_id, null: true
      t.integer :circle_id, null: true

      t.timestamps
    end

    add_index :friend_circle_memberships, :friend_id
    add_index :friend_circle_memberships, :circle_id
  end
end
