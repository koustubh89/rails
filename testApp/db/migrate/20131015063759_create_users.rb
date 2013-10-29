class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :DOB
      t.string :gender
      t.string :location
      t.string :project_name
      t.integer :project_id
      t.string :hobbies
      t.string :interest
      t.string :emp_id

      t.timestamps
    end
  end
end
