require './trimmer'
require './person'

describe 'Test the trimmerDecorator class' do
  it 'It should change name to 10 characters top' do
    person = Person.new(20, 'maximilianus')
    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq('maximilian')
  end
end
