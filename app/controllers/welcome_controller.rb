class WelcomeController < ApplicationController
  def index
  end

  def result

    #calculating average scores for each assessment section-wise
    fa1_a=Assessment.find_all_by_name("FA1").select{|ass| ass.students[0].section_id == 1}.collect{|ass| ass.score}.sum/10
    fa1_b=Assessment.find_all_by_name("FA1").select{|ass| ass.students[0].section_id == 2}.collect{|ass| ass.score}.sum/10

    fa2_a=Assessment.find_all_by_name("FA2").select{|ass| ass.students[0].section_id == 1}.collect{|ass| ass.score}.sum/10
    fa2_b=Assessment.find_all_by_name("FA2").select{|ass| ass.students[0].section_id == 2}.collect{|ass| ass.score}.sum/10

    sa1_a=Assessment.find_all_by_name("SA1").select{|ass| ass.students[0].section_id == 1}.collect{|ass| ass.score}.sum/10
    sa1_b=Assessment.find_all_by_name("SA1").select{|ass| ass.students[0].section_id == 2}.collect{|ass| ass.score}.sum/10

    #calculating average scores for each assessment
    fa1=Assessment.find_all_by_name("FA1").collect{|ass| ass.score}.sum/20
    fa2=Assessment.find_all_by_name("FA2").collect{|ass| ass.score}.sum/20
    sa1=Assessment.find_all_by_name("SA1").collect{|ass| ass.score}.sum/20

    @student=Student.find_by_name(params[:student])

    #using gon gem to send data to Javascript in the view
    gon.results=[[{x: -1, y: fa1_a},{x: 0, y: fa2_a},{x: 1, y: sa1_a}], 
           [{x: -1, y: fa1_b},{x: 0, y: fa2_b}, {x: 1, y: sa1_b}],
           [{x: -1, y: fa1}, {x: 0, y: fa2}, {x: 1, y: sa1}],
           [{x: -1, y: @student.assessments[0].score},{x: 0, y: @student.assessments[1].score},{x: 1, y: @student.assessments[2].score}],
            {name: @student.name} ]

  end
end
