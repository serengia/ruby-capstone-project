require_relative '../game/author'
require_relative '../item'

describe Author do
  before :each do
    @author = Author.new(nil, 'First name', 'Last name')
  end
  it 'should return first name' do
    expect(@author.first_name).to eq 'First name'
  end

  it 'should return last name' do
    expect(@author.last_name).to eq 'Last name'
  end

  it 'should add item' do
    item = Item.new(nil, Time.now)
    @author.add_item(item)
    expect(@author.items.length).to eq 1
  end
end
