require "../item"

class Genre < Item
  attr_reader :items, :id
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000) + Random.rand(1..1000)
    @items = []
    @name = name
  end

  def add_item(item)
    @items.push(item)
  end
end
