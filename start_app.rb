require_relative 'app'

class StartApp
  def initialize
    @app = App.new
  end

  def start_app(option)
    if option >= 1 && option <= 6
      list_items(option)
    else
      add_item(option)
    end
  end

  def list_items(option)
    case option
    when 1
      @app.games_list
    when 2
      @app.books_list
    when 3
      @app.music_albums_list
    when 4
      @app.authors_list
    when 5
      @app.genres_list
    when 6
      @app.labels_list
    else
      puts 'Kindly enter valid input'
    end
  end

  def add_item(option)
    case option
    when 7
      @app.add_book
    when 8
      @app.add_game
    when 9
      @app.add_music_album
    else
      puts 'Kindly enter valid input'
    end
  end
end
