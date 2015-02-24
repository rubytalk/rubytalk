class Member < ActiveRecord::Base
  has_many :failed_invitations

  validates :email, uniqueness: true, presence: true
  validates_presence_of :name
end
