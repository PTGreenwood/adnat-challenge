class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Must have a name
  #validates :name, presence: true

  #Must have an email
  #validates :email, presence: true

  #Must have password and password confirmation
  #Note: Password validation will be done in controller.
  #Note: Possibly will update with bcrypt for password hashing
  #validates :password, presence: true
  #validates :confirm_password, presence: true

  #Referential Constraints
  belongs_to :organisation, optional: true
  
end
