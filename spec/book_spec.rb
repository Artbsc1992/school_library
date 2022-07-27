require './book'
require './person'
describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Person.new(18, 'Luis', true)
  end

  describe '#new' do
    it 'should create a new book' do
      expect(@book).to be_a Book
    end
  end

  it 'should match a title' do
    expect(@book.title).to eq 'Title'
  end

  it 'should match an author' do
    expect(@book.author).to eq 'Author'
  end
end
