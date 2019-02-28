class Shift < ApplicationRecord

  validates :start, presence: true #Must have a start time.
  validates :finish, presence: true #Must have an end time
  validates :breaklength, presence: true #Break length is required

  validates_time :start, :between => ['12:00am', '11:59pm'] #Start time must be a valid time
  validates_time :finish, :between => ['12:00am', '11:59pm'] #End time must be a valid time
  validates_time :finish, :after => lambda {:start}
  #Finish time must be > than start time (at this stage. Overnight shifts may complicate things).

  #Referential Constrains
  belongs_to :user, optional: false #A shift must belong to a user.

  #NOTE: Incorporate DateValidator GEM for date validation as rails doesn't seem to support it at this present time.

end
