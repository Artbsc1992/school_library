require './classrom'
require './student'
describe Classroom do
  before :each do
    @classroom = Classroom.new("1A")
    @student = Student.new(20, "Luis", true)
  end

  describe '#new' do
    it 'Should return a new Classroom object' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end

    it 'Has the correct label' do
      expect(@classroom.label).to eq("1A")
    end

    it 'Has an empty array of students' do
      expect(@classroom.students).to eq([])
    end
  end
end