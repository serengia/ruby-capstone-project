class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
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

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
