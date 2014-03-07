class WelcomeController < ApplicationController
  def index


  end

  def result

    fa1_a=Assessment.find_all_by_name("FA1").select{|ass| ass.students[0].section_id == 1}
    fa1_b=Assessment.find_all_by_name("FA1").select{|ass| ass.students[0].section_id == 2}

    fa2_a=Assessment.find_all_by_name("FA2").select{|ass| ass.students[0].section_id == 1}
    fa2_b=Assessment.find_all_by_name("FA2").select{|ass| ass.students[0].section_id == 2}

    sa1_a=Assessment.find_all_by_name("SA1").select{|ass| ass.students[0].section_id == 1}
    sa1_b=Assessment.find_all_by_name("SA1").select{|ass| ass.students[0].section_id == 2}

    fa1=Assessment.find_all_by_name("FA1")
    fa2=Assessment.find_all_by_name("FA2")
    sa1=Assessment.find_all_by_name("SA1")

    score_fa1_a,score_fa1_b,score_fa2_a,score_fa2_b,score_sa1_a,score_sa1_b,score_fa1,score_fa2,score_sa1=0,0,0,0,0,0,0,0,0
    
    for fa in fa1_a
      score_fa1_a+=fa.score
    end
    for fa in fa1_b
      score_fa1_b+=fa.score
    end
    for fa in fa2_a
      score_fa2_a+=fa.score
    end
    for fa in fa2_b
      score_fa2_b+=fa.score
    end
    for sa in sa1_a
      score_sa1_a+=sa.score
    end
    for sa in sa1_b
      score_sa1_b+=sa.score
    end

    for fa in fa1 
      score_fa1+=fa.score
    end

    for fa in fa2 
      score_fa2+=fa.score
    end

    for sa in sa1 
      score_sa1+=sa.score
    end 

    @student=Student.find_by_name(params[:student])

    gon.results=[[{x: -1, y: score_fa1_a/10},{x: 0, y: score_fa2_a/10},{x: 1, y: score_sa1_a/10}], 
           [{x: -1, y: score_fa1_b/10},{x: 0, y: score_fa2_b/10}, {x: 1, y: score_sa1_b/10}],
           [{x: -1, y: score_fa1/20}, {x: 0, y: score_fa2/20}, {x: 1, y: score_sa1/20}],
           [{x: -1, y: @student.assessments[0].score},{x: 0, y: @student.assessments[1].score},{x: 1, y: @student.assessments[2].score}],
            {name: @student.name} ]

  end
end
