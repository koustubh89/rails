class DropTest1sTable < ActiveRecord::Migration
  def up
drop_table :test1s
  end

  def down
  end
end
