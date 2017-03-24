class User < ApplicationRecord
  has_many :pics
  has_many :authentications

  before_save { self.email = email.downcase }
  # validates :username, presence: true,
  #           uniqueness: { case_sensitive: false },
  #            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
     u.username = auth_hash[:info]["name"]
     u.password = "PLACEHOLDER"
     u.email = auth_hash["extra"]["raw_info"]["email"]
     u.authentications<<authentication
   end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end
# Rails.logger.debug "FB Data: #{auth_hash.inspect}"

  # user = User.create!(username: auth_hash["info"]["name"], email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex)




# def self.sign_in_from_omniauth(auth)
#   find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
# end
#
# def self.create_user_from_omniauth(auth)
#   create(
#   provider: auth['provider'],
#   uid: auth['uid'],
#   name: auth['info']['name']
#   )
# end
