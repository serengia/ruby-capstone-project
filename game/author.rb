class Author
  attr_reader :id, :first_name, :last_name
  attr_accessor :items

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end
end
