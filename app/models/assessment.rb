class Assessment < ActiveRecord::Base
  attr_accessible :name, :score
  has_and_belongs_to_many :students
end
