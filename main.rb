require_relative 'start_app'
def main
  start = StartApp.new
  puts 'Welcome to Catalog of things'

  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List of all games'
    puts '2 - List of all books'
    puts '3 - List all music albums'
    puts '4 - List of Authors'
    puts '5 - List of Genres'
    puts '6 - List of Labels'
    puts '7 - Add a book'
    puts '8 - Add a game'
    puts '9 - Add a music album'
    puts '0 - Exit'
    option = gets.chomp.to_i

    if option.zero?
      puts 'Thanks for using this app!'
      break
    end

    start.start_app(option)
  end
end

main
