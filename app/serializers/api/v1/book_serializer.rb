module Api
  module V1
    class BookSerializer < ActiveModel::Serializer
      attributes :id,
                 :title,
                 :description,
                 :year,
                 :isbn,
                 :price,
                 :author,
                 :collection

      delegate :author_id,
               :collection_id,
               to: :object

      def collection
        return {} if collection_id.nil?
        {
          id: set_collection.id,
          title: set_collection.title
        }
      end

      def author
        return {} if author_id.nil?
        {
          id: set_author.id,
          name: set_author.name
        }
      end

      private

      def set_author
        Author.find(author_id)
      end

      def set_collection
        Collection.find(collection_id)
      end
    end
  end
end
