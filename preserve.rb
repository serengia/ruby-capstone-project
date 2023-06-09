require 'json'
class Preserve
  attr_accessor :books, :labels, :games, :authors, :music_albums, :genres

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @music_albums = []
    @genres = []
  end

  def load_books
    return unless File.exist?('./data/books.json')

    books_loaded = JSON.parse(File.read('./data/books.json'))
    books_loaded.each do |book|
      new_book = Book.new(book['id'], book['publish_date'], book['publisher'], book['cover_state'])
      new_label = @labels.select { |label| label.id == book['label_id'] }[0]
      new_book.add_label(new_label)
      @books << new_book
    end
  end

  def load_labels
    return unless File.exist?('./data/labels.json')

    labels_loaded = JSON.parse(File.read('./data/labels.json'))
    labels_loaded.each do |label|
      new_label = Label.new(label['id'], label['title'], label['color'])
      @labels << new_label
    end
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

  def load_music_albums
    return unless File.exist?('./data/music_albums.json')

    music_albums_loaded = JSON.parse(File.read('./data/music_albums.json'))
    music_albums_loaded.each do |music_album|
      new_music_album = MusicAlbum.new(music_album['id'], music_album['publish_date'], music_album['on_spotify'])
      new_genre = @genres.select { |genre| genre.id == music_album['genre_id'] }[0]
      new_music_album.add_genre(new_genre)
      @music_albums << new_music_album
    end
  end

  def load_genres
    return unless File.exist?('./data/genres.json')

    genres_loaded = JSON.parse(File.read('./data/genres.json'))
    genres_loaded.each do |genre|
      new_genre = Genre.new(genre['id'], genre['name'])
      @genres << new_genre
    end
  end

  def save_book(book)
    new_book = { id: book.id, publish_date: book.publish_date, publisher: book.publisher,
                 cover_state: book.cover_state, label_id: book.label.id }
    if File.exist?('./data/books.json')
      books_loaded = JSON.parse(File.read('./data/books.json'))
      books_loaded << new_book
      File.write('./data/books.json', JSON.pretty_generate(books_loaded))
    else
      File.write('./data/books.json', JSON.pretty_generate([new_book]))
    end
  end

  def save_label(label)
    new_label = { id: label.id, title: label.title, color: label.color }
    if File.exist?('./data/labels.json')
      labels_loaded = JSON.parse(File.read('./data/labels.json'))
      labels_loaded << new_label
      File.write('./data/labels.json', JSON.pretty_generate(labels_loaded))
    else
      File.write('./data/labels.json', JSON.pretty_generate([new_label]))
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

  def save_music_album(music_album)
    new_music_album = { id: music_album.id, publish_date: music_album.publish_date,
                        on_spotify: music_album.on_spotify, genre_id: music_album.genre.id }
    if File.exist?('./data/music_albums.json')
      music_albums_loaded = JSON.parse(File.read('./data/music_albums.json'))
      music_albums_loaded << new_music_album
      File.write('./data/music_albums.json', JSON.pretty_generate(music_albums_loaded))
    else
      File.write('./data/music_albums.json', JSON.pretty_generate([new_music_album]))
    end
  end

  def save_genre(genre)
    new_genre = { id: genre.id, name: genre.name }
    if File.exist?('./data/genres.json')
      genres_loaded = JSON.parse(File.read('./data/genres.json'))
      genres_loaded << new_genre
      File.write('./data/genres.json', JSON.pretty_generate(genres_loaded))
    else
      File.write('./data/genres.json', JSON.pretty_generate([new_genre]))
    end
  end
end
