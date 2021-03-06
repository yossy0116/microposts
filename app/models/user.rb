class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensivive: false }
  has_secure_password
  validates :location, absence: true, 
                       on: :create
  validates :location, allow_blank: true, 
                       length: { minimum: 2, maximum: 20 }, 
                       on: :update
                       
  has_many :microposts
  
end
