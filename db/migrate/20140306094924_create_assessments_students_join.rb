class CreateAssessmentsStudentsJoin < ActiveRecord::Migration
  def up
  	create_table :assessments_students, :id => false do |t|
  		t.integer "assessment_id"
  		t.integer "student_id"
  	end

  	add_index :assessments_students, ["assessment_id","student_id"]
  end

  def down
  	drop_table :assessments_students
  end
end
