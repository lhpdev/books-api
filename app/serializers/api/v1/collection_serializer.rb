module Api
  module V1
    class CollectionSerializer < ActiveModel::Serializer
      attributes :id,
                 :title,
                 :author,
                 :books

     delegate :id,
              to: :object

      def books
        return [] if object.books.nil?
        serialized_books = []
        object.books.select do |book|
          serialized_books << serialized_book(book)
        end
        serialized_books
      end

      def author
        return {} if set_author.nil?
        {
          id: set_author.id,
          name: set_author.name
        }
      end

      private

      def set_author
        object.author
      end

      def serialized_book(book)
        Api::V1::BookSerializer.new(book, root: false)
      end
    end
  end
end
