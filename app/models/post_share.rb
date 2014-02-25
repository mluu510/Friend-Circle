# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  circle_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class PostShare < ActiveRecord::Base

  belongs_to(
    :post,
    :class_name => 'Post',
    :foreign_key => :post_id,
    :primary_key => :id
  )

  belongs_to(
    :circle,
    :class_name => 'FriendCircle',
    :foreign_key => :circle_id,
    :primary_key => :id
  )

end
