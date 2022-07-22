require './person'
require './book'
require './teacher'
require './student'

class App

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
    p "7 - Exit\n\n"
    action(gets.chomp)
  end

  def run
    choice = show_menu
    case choice
    when '1' then action_list_books
    when '2' then action_list_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_rental
    when '7' then p 'Thanks for using this App!' exit
    else
      p 'Wrong command try again please.'
    end
  end

  def list_book
    @my_books.each_with_index do |x, index|
      puts "#{index}) Title: \"#{x.title}\", Author: #{x.author}"
    end
  end
end
