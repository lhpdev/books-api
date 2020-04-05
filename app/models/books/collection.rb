module Books
  class Collection < ApplicationRecord
    self.table_name = 'collections'
    
    has_many :books

    validates :title, presence: true

    def author
      books.first.author if books.any?
    end
  end
end
