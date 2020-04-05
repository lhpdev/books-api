class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.decimal :price
      t.string :description
      t.string :year
      t.integer "author_id"
      t.integer "collection_id"
      t.index ["author_id"], name: "index_books_on_author_id"
      t.index ["collection_id"], name: "index_books_on_collection_id"
    end
  end
end
