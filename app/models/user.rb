class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :projects
end
