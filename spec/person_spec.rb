require './person'
require './book'
describe Person do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Person.new(18, 'Luis', true)
  end

  describe '#new' do
    it 'Should create a new Person' do
      expect(@person).to be_a Person
    end

    it 'Check if the correct name is assigned' do
      expect(@person.correct_name).to eq 'Luis'
    end

    it 'Check if the person can use the services' do
      expect(@person.can_use_services?).to eq true
    end

    # Change of_age? to public
    it 'Check if it is of age' do
      expect(@person.of_age?).to be true
    end
  end
end
