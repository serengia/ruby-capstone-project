require_relative '../music/genre'

describe 'Genre class' do
  before :each do
    @genre = Genre.new(nil, 'Rock')
  end
  it 'should return genre name' do
    expect(@genre.name).to eq 'Rock'
  end
end
