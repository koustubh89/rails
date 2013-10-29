class AddUserToMembers < ActiveRecord::Migration
  def change
    add_column :members, :user, :reference
  end
end
