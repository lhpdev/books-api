module Books
  class Search
    include Interactor

    delegate :q,
             to: :context

    def call
      context.items = search_books
    end

    private

    def search_books
      search_by_title.present? ? search_by_title : search_by_isbn
    end

    def search_by_title
      Book.where(title: q)
    end

    def search_by_isbn
      Book.where(isbn: q)
    end
  end
end
