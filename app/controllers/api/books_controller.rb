module Api
  class BooksController < ApplicationController
    before_action :set_book, only: [:show, :destroy]

    def index
      result = Books::Search.call(q: params[:q])

      if result.success? && result.items.any?
        respond_to do |format|
          format.any do
            render json: result.items, serializer: V1::SearchResultSerializer, root: false, status: :ok
          end
        end
      else
        respond_to do |format|
          format.any do
            render json: {}, root: false, status: 404
          end
        end
      end
    end

    def show
      respond_to do |format|
        format.any do
          render json: @book, serializer: V1::BookSerializer, root: false, status: :ok
        end
      end
    end

    def create
      @book = Book.create(book_params)

      if @book.save
        render json: @book, serializer: V1::BookSerializer, root: false, status: :ok
      else
        render json: { errors: @book.errors }, root: false, status: 400
      end
    end

    def destroy
      if @book.destroy
        render json: {}, root: false, status: :ok
      else
        render json: { errors: book.errors }, root: false, status: :bad_request
      end
    end

    private

    def set_book
      @book ||= Book.find(params[:id])
    end

    def book_params
      {
        title: permitted_params[:title],
        isbn: permitted_params[:isbn],
        description: permitted_params[:description],
        price: permitted_params[:price],
        year: permitted_params[:year]
      }
    end

    def permitted_params
      params.require(:book).permit(:title, :isbn, :description, :year, :price, :collection_id, :author_id)
    end
  end
end
