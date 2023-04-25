class MusicAlbum
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = ""
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_items(item)
    @items.push(item)
  end
end
