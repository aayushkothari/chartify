# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140306094924) do

  create_table "assessments", :force => true do |t|
    t.string   "name"
    t.float    "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assessments_students", :id => false, :force => true do |t|
    t.integer "assessment_id"
    t.integer "student_id"
  end

  add_index "assessments_students", ["assessment_id", "student_id"], :name => "index_assessments_students_on_assessment_id_and_student_id"

  create_table "grades", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.integer  "grade_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sections", ["grade_id"], :name => "index_sections_on_grade_id"

  create_table "students", :force => true do |t|
    t.string   "name"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "students", ["section_id"], :name => "index_students_on_section_id"

end
