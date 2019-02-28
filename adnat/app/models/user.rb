class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #NOTE: Only 2 model constraints to be added. As Devise will handle most, if not all of these. Especailly encrypted password
  validates :name, presence: true, length: { minimum: 3 } #must have a name of minimum 3 letters
  validates :email, presence: true, length: { minimum: 5 } #email must be a minimum of 5 letters - Note: Client checks will catch this first. This is to save it going into the DB

  #Referential Constraints
  belongs_to :organisation, optional: true #Setting optional to true, allows a user to not be a part of an organisation (such as when first registering)
  has_many :shifts
  
end
