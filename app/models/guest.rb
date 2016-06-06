class Guest < ActiveRecord::Base

  has_many :invitations
  has_many :events, :through => :invitations

  def full_name
    "#{first_name} #{last_name}"
  end

end
