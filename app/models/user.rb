# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

   validates :user_name, 
    uniqueness: true, 
    length: { in: 3..30 }, 
    format: { without: URI::MailTo::EMAIL_REGEXP, message:  "can't be an email" }
  validates :email, 
    uniqueness: true, 
    length: { in: 3..255 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { in: 6..255 }, allow_nil: true

  before_validation :ensure_session_token

    has_one :cart,
      foreign_key: :user_id,
      class_name: :Cart,
      dependent: :destroy

    has_many :cart_items,
      through: :cart,
      source: :cart_items

    has_many :order_history_items,
      foreign_key: :user_id,
      class_name: :OrderHistoryItem,
      dependent: :destroy

  def self.find_by_credentials(credentials, password)
    user = self.find_by(email: credentials)

    user&.authenticate(password) ? user : nil
    
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    self.save!
    self.session_token
  end

  private

  def generate_unique_session_token
      SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end

end
