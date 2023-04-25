require_relative 'spec_helper'
require_relative '../book/label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new('label1', 'red')
  end

  it 'has a title' do
    expect(label.title).to eq('label')
  end

  it 'has a color' do
    expect(label.color).to eq('red')
  end

  it 'should return true if the label has an item' do
    @item = Item.new('2002-01-01')
    @item.add_label(@label)
    expect(@label.items).to include(@item)
  end
end
