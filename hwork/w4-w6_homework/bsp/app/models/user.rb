class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_username

  has_many :books

  validates :username, length: { maximum: 50 }
  validate :set_username

  private

  def set_username
    self.username = self.email.split('@').first
    
    if self.username.length < 5
      self.username = self.username + self.username
    end
  end

end
