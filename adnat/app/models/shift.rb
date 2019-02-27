class Shift < ApplicationRecord
  belongs_to :user, optional: false
end
