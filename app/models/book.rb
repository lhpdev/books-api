class Book < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :collection, optional: true

  validates :title, presence: true
  validates :description, length: { maximum: 300 }
  validates :isbn, presence: true, uniqueness: true
end
