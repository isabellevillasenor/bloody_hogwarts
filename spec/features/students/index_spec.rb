require 'rails_helper'

RSpec.describe 'Student Index' do
  before :each do
    @malfoy = Student.create!(name: 'Draco Malfoy', age: 16, house: 'Slytherin')
  end

  it 'shows name, age and house' do
    visit '/students'

    expect(page).to have_content(@malfoy.name)
    expect(page).to have_content(@malfoy.age)
    expect(page).to have_content(@malfoy.house)
  end
end