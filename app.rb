require 'date'
require_relative 'preserve'
require_relative './game/game'
require_relative './game/author'
require_relative './books/book'
require_relative './books/label'

class App
  def initialize
    @preserve = Preserve.new
    @preserve.load_authors
    @preserve.load_games
    @preserve.load_books
    @preserve.load_labels
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
    new_game = Game.new(nil, publish_date, multiplayer, last_played_at)
    puts "Enter author details\n"
    new_author = add_author
    new_game.add_author(new_author)
    @preserve.games.push(new_game)
    @preserve.save_game(new_game)
    puts 'Game created successfully'
  end

  private

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

  # Books
  def books_list
    return puts 'No books found' if @preserve.books.empty?

    @preserve.books.each_with_index do |book, index|
      puts "#{index + 1}) Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
    end
  end

  def labels_list
    return puts 'No labels found' if @preserve.labels.empty?

    @preserve.labels.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
    end
  end

    def add_label
    puts 'Enter title'
    title = gets.chomp
    puts 'Enter color'
    color = gets.chomp
    new_label = Label.new(nil, title, color)
    @preserve.labels.push(new_label)
    @preserve.save_label(new_label)
    new_label
  end

  def add_book
    puts 'Is it publisher [Y / N]'
    publisher = gets.chomp.downcase == 'y'
    puts 'Enter cover state '
    cover_state = gets.chomp
    puts 'Enter the publish date in format (YYYY-MM-DD)'
    publish_date = Date.parse(gets.chomp)
    new_book = Book.new(nil, publish_date, publisher, cover_state)
    puts "Enter label details\n"
    new_label = add_label
    new_book.add_label(new_label)
    @preserve.books.push(new_book)
    @preserve.save_book(new_book)
    puts 'Book created successfully'
  end
end
