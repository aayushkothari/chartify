class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.string :name
      t.references :grade

      t.timestamps
    end
    add_index :sections, :grade_id
  end
  def down
  	drop_table :sections
  end

end
