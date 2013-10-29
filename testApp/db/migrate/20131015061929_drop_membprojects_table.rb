class DropMembprojectsTable < ActiveRecord::Migration
  def up

drop_table :membprojects
  end

  def down
  end
end
