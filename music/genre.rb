class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name)
    @id = Random.rand(1..1000) + Random.rand(1..1000)
    @items = []
    @name = name
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self)
  end
end
