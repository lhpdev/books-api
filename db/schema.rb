ActiveRecord::Schema.define(version: 2020_04_05_114842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "isbn"
    t.decimal "price"
    t.string "description"
    t.string "year"
    t.integer "author_id"
    t.integer "collection_id"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["collection_id"], name: "index_books_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
  end

end
