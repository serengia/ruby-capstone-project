require 'json'
require_relative './game/game'
require_relative './game/author'
class Preserve
    attr_accessor :games, :authors

    def initialize
        @games = []
        @authors = []
    end

    def load_games
        return unless File.exist?('games.json')
    
        games_loaded = JSON.parse(File.read('games.json'))
        games_loaded.each do |game|
          new_game = Game.new(game['id'], game['publish_date'], game['multiplayer'], game['last_played_at'])
          new_author = @authors.select { |author| author.id == game['author_id'] }[0]
          new_game.add_author(new_author)
          @games << new_game
        end
      end

    def load_authors
        return unless File.exist?('authors.json')
        
        authors_data = JSON.parse(File.read('authors.json'))

        authors_data.each do |item|
            author = Author.new(item['id'], item['first_name'], item['last_name'])
            @authors << author
        end
    end

    def save_game(game)
        new_game = {id: game.id, publish_date:game.publish_date, multiplayer: game.multiplayer, last_played_at: game.last_played_at, author_id:game.author.id}
        if File.exist?('games.json')
            games_data = JSON.parse(File.read('games.json'))
            games_data << new_game
            File.write('games.json', JSON.pretty_generate(games_data))
        else
            File.write('games.json', JSON.pretty_generate([new_game]) )
        end
    end

    def save_author(author)
        new_author = {id:author.id, first_name: author.first_name, last_name: author.last_name}

        if File.exist?('authors.json')
            authors_data = JSON.parse(File.read('authors.json'))
            authors_data << new_author
            File.write('authors.json', JSON.pretty_generate(authors_data))
        else
            File.write('authors.json', JSON.pretty_generate([new_author]))
        end
    end
end

preserve = Preserve.new

preserve.load_games