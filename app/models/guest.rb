class Guest < ActiveRecord::Base

  has_many :invitations
  has_many :events, :through => :invitations

  has_one :user

  def full_name
    "#{first_name} #{last_name}"
  end

end
