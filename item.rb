class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
  end

  def can_be_archived?
    # calculate the age of the item in years
    age_in_years = (Time.now.year - @publish_date.year)

    return true if age_in_years >= 10

    false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
