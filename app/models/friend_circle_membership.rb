# == Schema Information
#
# Table name: friend_circle_memberships
#
#  id         :integer          not null, primary key
#  friend_id  :integer
#  circle_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class FriendCircleMembership < ActiveRecord::Base
  validates :friend_id, :circle_id, :presence => true, :numericality => true


  belongs_to(
  :circle,
  :class_name => "FriendCircleMembership",
  :foreign_key => :friend_id,
  :primary_key => :id
  )

  belongs_to(
  :friend,
  :class_name => "User",
  :foreign_key => :friend_id,
  :primary_key => :id
  )
end
