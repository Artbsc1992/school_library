require './rental'

describe Rental do
  before :each do
    @rental = Rental.new('2016, 1, 1')
  end

  describe '#new' do
    it 'Returns a new Rental object' do
      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'Should match the date' do
      expect(@rental.date).to eq('2016, 1, 1')
    end
  end
end
