# == Schema Information
#
# Table name: friend_circles
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class FriendCircle < ActiveRecord::Base

  validates :owner_id, :presence => true, :numericality => true

  belongs_to(
    :owner,
    :class_name => "User",
    :foreign_key => :owner_id,
    :primary_key => :id
  )

  has_many(
    :friendships,
    :class_name => "FriendCircleMembership",
    :foreign_key => :circle_id,
    :primary_key => :id,
    :dependent => :destroy
  )

  has_many(
    :friends,
    :through => :friendships,
    :source => :friend
  )

  has_many(
    :post_shares,
    :dependent => :destroy
  )
end
