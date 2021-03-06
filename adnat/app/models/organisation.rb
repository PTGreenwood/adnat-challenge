class Organisation < ApplicationRecord
    #Must have a name of minimum 1 character.
    validates :name, presence: true, length: { in: 1..30 }

    #Must have an hourly rate attached
    validates :hourly_rate, presence: true

    #Referential Constraints
    has_many :users
    
end
