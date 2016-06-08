class Guest < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true

  has_many :invitations
  has_many :events, :through => :invitations

  has_one :user

  def full_name
    "#{first_name} #{last_name}"
  end

end
