require './app'

def main
  app = App.new

  response = nil

  puts "Welcome to School Library App!\n\n"
  while response != '7'
    p 'Please choose an option by entering a number:'
    p '1 - List all books'
    p '2 - List all people'
    p '3 - Create a people'
    p '4 - Create a book'
    p '5 - Create a rental'
    p '6 - List all rentals for a given person id'
    p '7 - Exit'
    response = gets.chomp

    case response
    when '1'
      app.action_list_books
    when '2'
      app.action_list_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rental
    when '7'
      p 'Thanks for using this App!'
      exit

    end
    app.save_data
  end
end

main
