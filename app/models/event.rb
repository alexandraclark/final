class Event < ActiveRecord::Base

  has_many :invitations
  has_many :guests, :through => :invitations

  has_one :list
  has_many :tasks, :through => :list

end
