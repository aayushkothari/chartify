class CreateGrades < ActiveRecord::Migration
  def up
    create_table :grades do |t|
      t.integer :number

      t.timestamps
    end

  end

  def down
  	drop_table :grades
  end
end
