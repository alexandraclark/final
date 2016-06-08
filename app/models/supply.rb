class Supply < ActiveRecord::Base

  validates :title, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a positive integer", allow_blank: true }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a positive integer", allow_blank: true }

  belongs_to :event

end
