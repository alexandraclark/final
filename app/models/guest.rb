class Guest < ActiveRecord::Base

  validates :first_name, :presence => { message: "must include first name" }
  validates :last_name, :presence => { message: "must include last name" }
  validates :phone, :presence => { message: "must include phone" }
  validates_format_of :phone, :with => /[0-9]{10}/ 
  validates :email, :presence => { message: "must include email" }

  has_many :invitations
  has_many :events, :through => :invitations

  has_one :user

  def full_name
    "#{first_name} #{last_name}"
  end

end
