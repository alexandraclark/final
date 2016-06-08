class Event < ActiveRecord::Base

  validates :budget, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a positive integer", allow_blank: true }
  validates :title, presence: true

  has_many :invitations
  has_many :guests, :through => :invitations

  has_one :list
  has_many :tasks, :through => :list

  has_many :supplies

end
