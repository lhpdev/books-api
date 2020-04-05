class Book < ApplicationRecord
  belongs_to :author
  belongs_to :collection, optional: true

  #adds validation for isbn uniq
  #adds validation for title uniq
  #adds validation for description size
end
