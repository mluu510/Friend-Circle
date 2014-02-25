# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :body, length: {minimum: 10, maximum: 200}
  validates :author_id, :body, presence: true

  has_many(
    :post_shares,
    :class_name => 'PostShare',
    :foreign_key => :post_id,
    :primary_key => :id,
    :dependent => :destroy
  )

  has_many(
    :links,
    :dependent => :destroy
  )


end
