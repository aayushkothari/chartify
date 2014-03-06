# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g=Grade.create({number: 9})
section_a=g.sections.create({name: "A"})
section_b=g.sections.create({name: "B"})

students_section_a=["Aayush","Ajay","Karan","Nikhil","Joe","Jack","Daniel","Sunny","Arvind","Shiela"]
students_section_b=["Mulayam","Mamta","Beyonce","Aishwarya","Ishita","Jaya","Abdul","Farhan","Niharika","Kapil"]

for stud in students_section_a
	section_a.students.create({name: stud})
end

for stud in students_section_b
	section_b.students.create({name: stud})
end

assessments=["FA1","FA2","SA1"]


for sec in Section.all
	for stud in sec.students.all 
		for ass in assessments
			stud.assessments.create({name: ass, score: rand})
		end
	end
end
