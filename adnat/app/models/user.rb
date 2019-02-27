class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    
  #NOTE: Only 1 extra model constraints to be added. As Devise will handle most, if not all of these.
  validates :name, presence: true #must have a name 

  #Referential Constraints
  belongs_to :organisation, optional: true #Setting optional to true, allows a user to not be a part of an organisation (such as when first registering)
  has_many :shifts
  
end
