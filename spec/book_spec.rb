require_relative '../books/book'
require_relative '../books/label'

describe Book do
  before :each do
    @book = Book.new(nil, '2010-01-01', 'publisher', true)
  end

  it 'has a publisher' do
    expect(@book.publisher).to eq('publisher')
  end

  it 'has a cover state' do
    expect(@book.cover_state).to eq(true)
  end

  it 'has a publish date' do
    expect(@book.publish_date).to eq('2010-01-01')
  end

  # it 'should return true if book is damaged' do
  #   @book.move_to_archive
  #   expect(@book.send(:can_be_archived?)).to be true
  # end

  # it 'should return true if book is older than 10 years' do
  #   @book.move_to_archive
  #   expect(@book.send(:can_be_archived?)).to be true
  # end
end
