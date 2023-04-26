require_relative 'app'

class StartApp
  def initialize
    @app = App.new
  end

  def start_app(option)
    if option >= 1 && option <= 2
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
      @app.list_authors
    else
      puts 'Kindly enter valid input'
    end
  end

  def add_item(option)
    case option
    when 3
      @app.add_game
    else
      puts 'Kindly enter valid input'
    end
  end
end
