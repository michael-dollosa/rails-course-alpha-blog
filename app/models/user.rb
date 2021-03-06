class User < ApplicationRecord
  #self is referencing to each object in the email class
  before_save { self.email = email.downcase }
  #adding association
  has_many :articles, dependent: :destroy #this means that destroy data under articles if dependencies are destroyed
  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: {maximum: 105},
                      format: { with: VALID_EMAIL_REGEX}
  
  has_secure_password
                      
end