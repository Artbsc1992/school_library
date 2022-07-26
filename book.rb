class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [title, author, rentals]
    }.to_json(*args)
  end

  def self.json_create(object)
    book = new(object['a'][0], object['a'][1])
    book.rentals = object['a'][2]
    book
  end
end
