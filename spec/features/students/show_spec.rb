require 'rails_helper'

RSpec.describe 'Students Show' do
  before :each do
    @malfoy = Student.create!(name: 'Draco Malfoy', age: 16, house: 'Slytherin')
    @dark_arts = Course.create!(name: "Defense Against The Dark Arts")
    StudentCourse.create!(student_id: @malfoy.id, course_id: @dark_arts.id)
  end
  describe 'when i vists a student/:id show page' do
    it 'should show a list of students courses' do
      visit "/students/#{@malfoy.id}"

      expect(page).to have_content(@dark_arts.name)
    end
  end
end