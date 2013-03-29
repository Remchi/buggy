class AddUserIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :user, index: true, default: 1
  end
end
