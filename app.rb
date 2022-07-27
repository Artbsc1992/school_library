require './person'
require './book'
require './teacher'
require './student'
require './rental'
require 'json'

class App
  def initialize
    @my_books = File.exist?('./books.json') ? JSON.parse(File.read('./books.json'), create_additions: true) : []
    @people = File.exist?('./people.json') ? JSON.parse(File.read('./people.json'), create_additions: true) : []
    @my_rentals = if File.exist?('./rentals.json')
                    JSON.parse(File.read('./rentals.json'),
                               { create_additions: true }).map do |rental|
                      instance_rental(rental)
                    end
                  else
                    []
                  end
  end

  def list_books
    @my_books.each_with_index do |x, index|
      puts "#{index}) Title: \"#{x.title}\", Author: #{x.author}"
    end
  end

  def list_people
    @people.each_with_index do |x, index|
      puts "#{index}) [#{x.class.name}] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}"
    end
  end

  def action_list_books
    p 'Book successfully created!'
    list_books
    p 'Press enter to continue...'
    gets.chomp
  end

  def action_list_people
    list_people
    p 'Press enter to continue...!'
    gets
  end

  def my_permission(my_char)
    case my_char
    when 'N'
      false
    when 'Y'
      true
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, nil, specialization)
    @people.push(teacher)
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(age, name, my_permission(permission), nil)
    @people.push(student)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end
    puts 'Person created successfully!'
    gets
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @my_books.push(new_book)
  end

  def create_rental
    puts 'Select a book from the following list by index'
    list_books
    book_index = gets.chomp
    puts 'Select a person from the following list by index'
    list_people
    person_index = gets.chomp
    print '\n Date(yyyy/mm/dd): '
    rental_date = gets.chomp
    new_rental = Rental.new(rental_date, @my_books[book_index.to_i], @people[person_index.to_i])
    @my_rentals.push(new_rental)
    puts 'Rental added successfully!'
  end

  def list_rental
    @people.each_with_index.map do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    print 'Please, write the ID of the person: '
    person_id = gets.chomp
    me = @people.filter do |x|
      x.id == person_id.to_i
    end.first
    p me
    me.rentals.each do |rental|
      p rental
      puts "Date: #{rental.date}, Book: #{rental.book.title} by Author: #{rental.book.author} "
    end
    puts 'Press any key to continue..'
  end

  def save_data
    File.write('books.json', JSON.generate(@my_books))
    File.write('people.json', JSON.generate(@people))
    File.write('rentals.json', JSON.generate(@my_rentals))
  end

  def instance_rental(rental)
    person = @people.filter do |e|
      e.id == rental[:person_id]
    end
    book = @my_books.filter do |e|
      e.title == rental[:book_title]
    end
    p rental, book[0], person[0]
    rent = Rental.new(rental[:date])
    rent.add_book(book[0])
    rent.add_person(person[0])
    rent
  end
end
