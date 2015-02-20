class Member < ActiveRecord::Base
  validates :email, unique: true, presence: true
  validates_presence_of :name
end
