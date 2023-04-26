require_relative 'start_app'
def main
  start = StartApp.new
  puts 'Welcom to Catalog of things'

  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List of all games'
    puts '2 - List of Authors'
    puts '3 - add-game'
    puts '0 - Exit'
    option = gets.chomp.to_i

    if option == 0
      puts 'Thanks for using this app!'
      break
    end

    start.start_app(option)
  end
end

main
