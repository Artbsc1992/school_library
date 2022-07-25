require './person'
require './book'
require './teacher'
require './student'
require './rental'
require './handlers'

class App
  include(Handlers)
  def initialize
    @my_books = []
    @my_rentals = []
    @people = []
  end

  def show_menu
    puts "Welcome to School Library App!\n\n"
    puts "Please choose an option by entering a number:\n"
    p '1 - List all books'
    p '2 - List all people'
    p '3 - Create a people'
    p '4 - Create a book'
    p '5 - Create a rental'
    p '6 - List all rentals for a given person id'
    p '7 - Exit'
    gets.chomp
  end

  def run
    choice = show_menu
    case choice
    when '1'
      action_list_books
    when '2'
      action_list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental
    when '7'
      p 'Thanks for using this App!'
      exit
    else
      run
    end
  end
end
