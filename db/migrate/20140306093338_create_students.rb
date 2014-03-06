class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :name
     
      t.references :section

      t.timestamps
    end
    add_index :students, :section_id
  end
  def down
    drop_table :students
  end
end
