class DropAuthMembersTable < ActiveRecord::Migration
  def up

drop_table:auth_members
  end

  def down
  end
end
