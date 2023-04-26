require 'json'
require_relative './game/game'
require_relative './game/author'
class Preserve
  attr_accessor :books, :labels, :games, :authors, :music_albums, :genres

  def initialize
    @games = []
    @authors = []
  end

  def load_games
    return unless File.exist?('./data/games.json')

    games_loaded = JSON.parse(File.read('./data/games.json'))
    games_loaded.each do |game|
      new_game = Game.new(game['id'], game['publish_date'], game['multiplayer'], game['last_played_at'])
      new_author = @authors.select { |author| author.id == game['author_id'] }[0]
      new_game.add_author(new_author)
      @games << new_game
    end
  end

  def load_authors
    return unless File.exist?('./data/authors.json')

    authors_loaded = JSON.parse(File.read('./data/authors.json'))
    authors_loaded.each do |author|
      new_author = Author.new(author['id'], author['first_name'], author['last_name'])
      @authors << new_author
    end
  end

  def save_game(game)
    new_game = { id: game.id, publish_date: game.publish_date, multiplayer: game.multiplayer,
                 last_played_at: game.last_played_at, author_id: game.author.id }
    if File.exist?('./data/games.json')
      games_loaded = JSON.parse(File.read('./data/games.json'))
      games_loaded << new_game
      File.write('./data/games.json', JSON.pretty_generate(games_loaded))
    else
      File.write('./data/games.json', JSON.pretty_generate([new_game]))
    end
  end

  def save_author(author)
    new_author = { id: author.id, first_name: author.first_name, last_name: author.last_name }
    if File.exist?('./data/authors.json')
      authors_loaded = JSON.parse(File.read('./data/authors.json'))
      authors_loaded << new_author
      File.write('./data/authors.json', JSON.pretty_generate(authors_loaded))
    else
      File.write('./data/authors.json', JSON.pretty_generate([new_author]))
    end
  end
end
