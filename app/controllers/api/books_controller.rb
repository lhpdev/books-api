module Api
  class BooksController < ApplicationController
    before_action :set_book

    def show
      respond_to do |format|
        format.any do
          render json: @book, serializer: V1::BookSerializer, root: false, status: :ok
        end
      end
    end

    private

    def set_book
      @book ||= Book.find(params[:id])
    end

    def permitted_params
      params.require(:book).permit(:id, :title, :isbn, :description, :year, :price, :collection_id, :author_id)
    end
  end
end
