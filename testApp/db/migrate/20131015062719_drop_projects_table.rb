class DropProjectsTable < ActiveRecord::Migration
  def up
drop_table:projects
  end

  def down
  end
end
