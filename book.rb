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
      'a' => [title, author]
    }.to_json(*args)
  end

  def self.json_create(obj)
    new(obj['a'][0], obj['a'][1])
  end
end
