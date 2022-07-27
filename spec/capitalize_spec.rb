require './capitalize'
require './person'

describe 'Test the CapitalizeDecorator class' do
  it 'It should change name to capitalize' do
    person = Person.new(20, 'maximilianus')
    capitalize = CapitalizeDecorator.new(person)
    expect(capitalize.correct_name).to eq('Maximilianus')
  end
end
