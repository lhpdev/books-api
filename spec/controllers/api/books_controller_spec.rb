# frozen_string_literal: true

require 'spec_helper'

module Api
  describe BooksController, type: :controller do

    describe "#show" do
      context 'with author and collection' do
        let(:collection) { create(:collection) }
        let(:book) { create(:book, price: '25.00', collection: collection) }

        it 'returns the expected json format' do
          get :show, params: { id: book.id }
          expect(response).to be_ok
          byebug
          expect(response.body).to include_json(
            id: book.id,
            title: book.title,
            description: book.description,
            year: book.year,
            isbn: book.isbn,
            price: book.price,
            author: {
              id: book.author.id,
              name: book.author.name
            },
            collection: {
              id: book.collection.id,
              title: book.collection.title
            }
          )
        end
      end
    end
  end
end
