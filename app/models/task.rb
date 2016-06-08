class Task < ActiveRecord::Base

  validates :item, presence: true

  belongs_to :list #, foreign_key: :list_id, class_name: "List"

end
