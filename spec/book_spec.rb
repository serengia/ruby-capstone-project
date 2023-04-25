require_relative 'spec_helper'
require_relative '../book/book'
require_relative '../book/label'

describe Book do
    before :each do
        @book = Book.new('publisher', 'good', '2010-01-01')
    end

    it 'has a publisher' do
            expect(book.publisher).to eq('publisher')
    end

    it 'has a cover state' do
            expect(book.cover_state).to eq('good')
    end

    it 'has a publish date' do
            expect(book.publish_date).to eq(time.parse('2010-01-01'))
    end

    it 'should return true if book is damaged' do
        @book = Book.new('2011-01-01', 'publisher', 'good')
        @book.move_to_archive
        expect(@book.send(:can_be_archived?)).to be true
    end

    it 'should return true if book is older than 10 years' do
        @book = Book.new('2002-01-01', 'publisher', 'good')
        @book.move_to_archive
        expect(@book.send(:can_be_archived?)).to be true
    end    
end