class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name
      t.float :score

      t.timestamps
    end
  end
end
