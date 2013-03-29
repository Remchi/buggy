class Project < ActiveRecord::Base
  has_many :issues
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :name, uniqueness: true

  
end
