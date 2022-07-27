require './teacher'
describe Teacher do
  before :each do
    @teacher = Teacher.new(20, 'Luis', true, 'Ruby')
  end

  describe '#new' do
    it 'Should return a new Teacher object' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end

    it 'Can use_services?' do
      expect(@teacher.can_use_services?).to eq(true)
    end

    it 'Has the correct specialization' do
      expect(@teacher.specialization).to eq('Ruby')
    end
  end
end
