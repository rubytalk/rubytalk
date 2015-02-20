class Member < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates_presence_of :name
end
