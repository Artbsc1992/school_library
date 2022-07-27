class Rental
  attr_accessor :date, :person, :book

  def initialize(date)
    @date = date
  end

  def add_book(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  def add_person(person)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [@date, @person.id, @book.title]
    }.to_json(*args)
  end

  def self.json_create(object)
    {
      date: object['a'][0],
      person_id: object['a'][1],
      book_title: object['a'][2]
    }
  end
end
