require './student'
require './classrom'
describe Student do
  before :each do
    @student = Student.new(20, "Luis", true)
    @classroom = Classroom.new("1A")
  end

  describe "#new" do
    it "Should return a new Student object" do
      expect(@student).to be_an_instance_of(Student)
    end

    it 'can play_hooky?' do
      expect(@student.play_hooky?).to eq("¯\(ツ)/¯")
    end
      
  end
end