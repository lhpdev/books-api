module Api
  module V1
    class SearchResultSerializer < ActiveModel::Serializer
      attributes :books

      def books
        serialized_books = []
        object.select do |book|
          serialized_books << serialized_book(book)
        end
        serialized_books
      end

      private

      def serialized_book(book)
        Api::V1::BookSerializer.new(book, root: false)
      end
    end
  end
end
