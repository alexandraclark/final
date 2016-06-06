class Invitation < ActiveRecord::Base

  belongs_to :guest  #, foreign_key: guest_id, class: "Guest"
  belongs_to :event  #, foreign_key: event_id, class: "Event"

end
