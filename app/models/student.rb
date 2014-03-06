class Student < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :assessments
  attr_accessible :name
end
