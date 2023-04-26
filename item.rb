class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(id, publish_date)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @genre = genre
    @author = author
    @source = source
    @label = label
    @archived = archived
  end

  def can_be_archived?
    # calculate the age of the item in years
    age_in_years = (Time.now - @publish_date)

    return true if age_in_years >= 10

    false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
