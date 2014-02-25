# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  content    :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base

  validates :post_id, :content, presence: true
  validates :post_id, numericality: true

  belongs_to :post


end
