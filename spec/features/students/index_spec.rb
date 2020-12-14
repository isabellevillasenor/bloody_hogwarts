require 'rails_helper'

RSpec.describe 'Student Index' do
  before :each do
    @malfoy = Student.create!(name: 'Draco Malfoy', age: 16, house: 'Slytherin')
    @jenny = Student.create!(name: 'Jenny Weasley', age: 15, house: 'Gryffindor')
    @cedric = Student.create!(name: 'Cedric Diggory', age: 17, house: 'Hufflepuff')
  end

  it 'shows name, age and house' do
    visit '/students'

    expect(page).to have_content(@malfoy.name)
    expect(page).to have_content(@malfoy.age)
    expect(page).to have_content(@malfoy.house)

    expect(page).to have_content(@jenny.name)
    expect(page).to have_content(@jenny.age)
    expect(page).to have_content(@jenny.house)

    expect(page).to have_content(@cedric.name)
    expect(page).to have_content(@cedric.age)
    expect(page).to have_content(@cedric.house)
  end

  it 'shows me an average of all students age' do
    visit '/students'

    expect(page).to have_content(16)
  end
end