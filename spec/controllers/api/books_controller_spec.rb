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

      context 'without collection' do
        let(:book) { create(:book, price: '25.00') }

        it 'returns the expected json format' do
          get :show, params: { id: book.id }
          expect(response).to be_ok
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
            collection: {}
          )
        end
      end
    end

    describe '#create' do
      context 'without author and collection' do
        let(:params) do
          {
            book: {
              title: 'Book Title',
              isbn: '8937192379173',
              description: 'Description',
              price: '30.00',
              year: '2000'
            }
          }
        end

        it 'should save the preferences' do
          post :create, params: params
          expect(response.status).to eq(200)
          expect(response.body).to include_json(params[:book])
        end
      end
    end

    describe "#show" do
      context 'without collection' do
        let(:book) { create(:book, price: '25.00') }

        it 'returns the expected json format' do
          delete :destroy, params: { id: book.id }
          expect(response).to be_ok
          expect(response.body).to include_json({})
        end
      end
    end
  end
end
