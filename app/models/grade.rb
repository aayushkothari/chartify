class Grade < ActiveRecord::Base
  attr_accessible :number
  has_many :sections
end
