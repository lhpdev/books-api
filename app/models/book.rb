class Book < ApplicationRecord
  belongs_to :author
  belongs_to :collection, optional: true

  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true
end
