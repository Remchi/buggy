class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :name, uniqueness: true
end
