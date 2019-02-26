class Organisation < ApplicationRecord
    #Must have a name of minimum 1 character.
    validates :name, presence: true, length: { minimum: 1 }

    #Must have an hourly rate attached
    validates :hourly_rate, presence: true
end
