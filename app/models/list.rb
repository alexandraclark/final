class List < ActiveRecord::Base

  has_many :tasks
  belongs_to :event   #, foreign_key: :event_id, class_name: "Event"

end
