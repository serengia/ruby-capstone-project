require "../music/genre"
require "../item"

describe "Genre class" do
  before :each do
    @genre = Genre.new("Rock")
  end
  it "should return genre name" do
    expect(@genre.first_name).to eq "Rock"
  end

  it "should add item" do
    item = Item.new(Time.now)
    @genre.add_item(item)
    expect(@genre.items.length).to eq 1
  end
end
