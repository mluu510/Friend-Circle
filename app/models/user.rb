# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  reset_token     :string(255)
#

class User < ActiveRecord::Base

  has_many :friend_circle, :foreign_key => :owner_id, :dependent => :destroy
  has_many :friendships, :through => :friend_circle, :source => :friendships
  has_many :friends, :through => :friendships, :source => :friend

  validates :email, :password_digest, :token, presence: true
  validates :email, :token, uniqueness: true
  validates :password, length: { minimum: 4, allow_nil: true }
  after_initialize :ensure_token
  after_save :ensure_friend_circle

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credential(email, pt)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(pt) ? user : nil
  end

  attr_reader :password

  def password=(plain_text)
    @password = plain_text
    self.password_digest = BCrypt::Password.create(plain_text)
  end

  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end

  def reset_token!
    self.token = self.class.generate_session_token
    self.save!
  end

  private
    def ensure_token
      self.token ||= self.class.generate_session_token
    end

    def ensure_friend_circle
      FriendCircle.create!(owner_id: self.id) unless self.friend_circle
    end


end
