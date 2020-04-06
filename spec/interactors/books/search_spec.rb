require 'spec_helper'

module Books
  describe Search do
    subject { Search.call(q: q) }

    describe 'with available books into the api' do
      let(:book) { create(:book) }
      let(:another_book) { create(:book, title: book.title) }

      context 'search with isbn' do
        let(:q) { book.isbn }

        it 'returns the searched book into the result' do
          expect(subject.items).to include(book)
        end
      end

      context 'search with title' do
        let(:q) { book.title }

        it 'returns the searched book into the result' do
          expect(subject.items).to include(book)
        end
      end
    end

    describe 'with unavailable book into the api' do
      let(:book) { build(:book) }

      context 'search with isbn' do
        let(:q) { book.isbn }

        it 'returns the searched book into the result' do
          expect(subject.items).to_not include(book)
        end
      end

      context 'search with title' do
        let(:q) { book.title }

        it 'returns the searched book into the result' do
          expect(subject.items).to_not include(book)
        end
      end
    end
  end
end
