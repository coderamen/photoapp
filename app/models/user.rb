class User < ApplicationRecord
  has_many :pics
  before_save { self.email = email.downcase }
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  # has_secure_password

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = User.create!(email: auth_hash["extra"]["raw_info"]["email"], username: "fbUser")
    user.authentications << (authentication)
    return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end
