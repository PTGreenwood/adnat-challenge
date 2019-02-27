class Shift < ApplicationRecord

  #Must have a name of minimum 1 character.
  validates :start_time, presence: true #Must have a start time.
  validates :finish_time, presence: true, numericality: {greater_than: :start_time} #Must have an end time and be greater than start time

  #Finish time must be > than start time (at this stage. Overnight shifts may complicate things).

  #Must have an hourly rate attached
  validates :hourly_rate, presence: true

  #Referential Constrains
  belongs_to :user, optional: false #A shift must belong to a user.

  #NOTE: Incorporate DateValidator GEM for date validation as rails doesn't seem to support it at this present time.

end
