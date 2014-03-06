class Section < ActiveRecord::Base
  belongs_to :grade
  has_many :students
  attr_accessible :name
end
