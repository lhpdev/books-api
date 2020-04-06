# frozen_string_literal: true

require 'spec_helper'

module Api
  describe BooksController, type: :controller do
    describe "#index" do
      context 'with searched book available' do
        let(:collection) { create(:collection) }
        let!(:book) { create(:book, title: 'The Magic', year: '2011', collection: collection) }
        let!(:similar_book) { create(:book, title: 'The Magic', year: '2020', collection: collection) }

        it 'searches book by title' do
          get :index, params: { q: book.title }
          expect(response).to be_ok
          expect(response.body).to include_json(
            books: [
              {
                id: /.*/,
                title: /.*/,
                description: /.*/,
                isbn: /.*/,
                year: /.*/,
                price: /.*/,
                author: {
                  author_id: /.*/,
                  name: /.*/
                },
                collection: {
                  collection_id: /.*/,
                  title: /.*/
                },
              },
              {
                id: /.*/,
                title: /.*/,
                description: /.*/,
                isbn: /.*/,
                year: /.*/,
                price: /.*/,
                author: {
                  author_id: /.*/,
                  name: /.*/
                },
                collection: {
                  collection_id: /.*/,
                  title: /.*/
                },
              },
            ]
          )
        end

        it 'searches book by isbn' do
          get :index, params: { q: book.isbn }
          expect(response).to be_ok
          expect(response.body).to include_json(
            books: [
              {
                id: book.id,
                title: book.title,
                description: book.description,
                year: book.year,
                isbn: book.isbn,
                price: book.price,
                author: {
                  author_id: book.author.id,
                  name: book.author.name
                },
                collection: {
                  collection_id: book.collection.id,
                  title: book.collection.title
                }
              }
            ]
          )
        end
      end

      context 'with not found book' do
        let(:collection) { create(:collection) }
        let!(:book) { build(:book, title: 'The Magic', year: '2011', collection: collection) }

        it 'searches book by title' do
          get :index, params: { q: book.title }
          expect(response).to_not be_ok
          expect(response.body).to include_json({})
        end

        it 'searches book by isbn' do
          get :index, params: { q: book.isbn }
          expect(response).to_not be_ok
          expect(response.body).to include_json({})
        end
      end
    end

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
              author_id: book.author.id,
              name: book.author.name
            },
            collection: {
              collection_id: book.collection.id,
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
              author_id: book.author.id,
              name: book.author.name
            },
            collection: {}
          )
        end
      end
    end

    describe '#create' do
      context 'without author and collection' do
        let(:collection) { create(:collection) }
        let(:author) { create(:author) }

        let(:params) do
          {
            book: {
              title: 'Book Title',
              isbn: '8937192379173',
              description: 'Description',
              price: '30.00',
              year: '2000',
              author_id: author.id,
              collection_id: collection.id
            }
          }
        end

        it 'should create book and return the serialized json correctly' do
          post :create, params: params
          expect(response.status).to eq(200)
          expect(response.body).to include_json(
            id:  /.*/,
            title: params[:book][:title],
            description: params[:book][:description],
            year: params[:book][:year],
            isbn: params[:book][:isbn],
            price: params[:book][:price],
            author: {
              author_id: params[:book][:author_id],
              name: /.*/
            },
            collection: {
              collection_id: params[:book][:collection_id],
              title: /.*/
            }
          )
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
