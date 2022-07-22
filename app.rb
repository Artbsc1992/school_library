class App

  @options = [
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - Exit'
  ]

  def initialize
    @options = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
  end

  def run
    puts 'Please choose an option by entering a number:'
    puts @options
    choice = gets.chomp.to_i
    action choice
  end

  def action(choice)
    puts choice
  end
end
