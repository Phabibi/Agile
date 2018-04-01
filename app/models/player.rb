require 'bcrypt'

class Player < ApplicationRecord
  attr_accessor :remember_token

  # Territory records will be cleared with the respective player.
  has_many :territory, dependent: :destroy

  # Attribute restrictions before saving to database.
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 4}
  validates :password, confirmation: { case_sensitive: true }

  def Player.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 							  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Player.new_token
    SecureRandom.urlsafe_base64
  end

  # Save remember_token to database:
  def remember
    self.remember_token = Player.new_token
    update_attribute(:remember_digest, Player.digest(remember_token))
  end

  # Verify logged in users:
  def authenticate(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Remove remember_token from database:
  def forget
    update_attribute(:remember_digest, nil)
  end

end
