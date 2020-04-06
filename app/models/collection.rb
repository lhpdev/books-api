class Collection < ApplicationRecord  
  has_many :books

  validates :title, presence: true

  def author
    books.first.author if books.any?
  end
end
