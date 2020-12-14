require 'rails_helper'

RSpec.describe 'Course Index Page' do
  before :each do
    @malfoy = Student.create!(name: 'Draco Malfoy', age: 16, house: 'Slytherin')
    @luna = Student.create!(name: 'Luna Lovegood', age: 16, house: 'Ravenclaw')
    @cedric = Student.create!(name: 'Cedric Diggory', age: 17, house: 'Hufflepuff')
    @granger = Student.create!(name: 'Hermione Granger', age: 16, house: 'Gryffindor')
    @dark_arts = Course.create!(name: "Defense Against The Dark Arts")
    @astronomy = Course.create!(name: "Astronomy")
    @potions = Course.create!(name: "Potions")
    StudentCourse.create(student_id: @malfoy.id, course_id: @dark_arts.id)
    StudentCourse.create(student_id: @luna.id, course_id: @dark_arts.id)
    StudentCourse.create(student_id: @cedric.id, course_id: @dark_arts.id)
    StudentCourse.create(student_id: @granger.id, course_id: @dark_arts.id)
    StudentCourse.create(student_id: @granger.id, course_id: @potions.id)
    StudentCourse.create(student_id: @granger.id, course_id: @astronomy.id)

  end

  describe 'when i visit /courses' do
    it 'will show all the courses and number of students in the course' do
      visit '/courses'

      expect(page).to have_content(@dark_arts.name)
      expect(page).to have_content(@dark_arts.students.count)
    end

    it 'will list classes in alphabetical order' do
      visit '/courses'

      expect("#{@astronomy.name}").to appear_before("#{@dark_arts.name}")
      expect("#{@dark_arts.name}").to appear_before("#{@potions.name}")
    end
  end
end