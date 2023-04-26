require 'date'
require_relative './game/game'
require_relative './game/author'
require_relative 'preserve'

class App
  def initialize
    @preserve = Preserve.new
    @preserve.load_games
    @preserve.load_authors
  end

  def games_list
    return puts 'No games found' if @preserve.games.empty?

    @preserve.games.each_with_index do |game, index|
      puts "#{index + 1}) Author: #{game.author.first_name} #{game.author.last_name}"
      puts "Multiplayer: #{game.multiplayer}, Last played: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def authors_list
    return puts 'No authors found' if @preserve.authors.empty?

    @preserve.authors.each_with_index do |author, index|
      puts "#{index + 1}) First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def add_game
    puts 'Is it multiplayer [Y / N]'
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Enter last played at in format (YYYY-MM-DD)'
    last_played_at = Date.parse(gets.chomp)
    puts 'Enter the publish date in format (YYYY-MM-DD)'
    publish_date = Date.parse(gets.chomp)
    game = Game.new(nil, publish_date, multiplayer, last_played_at)
    puts "Enter author details\n"
    author = add_author
    game.add_author(author)
    @preserve.games.push(game)
    @preserve.save_game(game)
    puts 'Game created successfully'
  end

  def add_author
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    new_author = Author.new(nil, first_name, last_name)
    @preserve.authors.push(new_author)
    @preserve.save_author(new_author)
    new_author
  end
end
