class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :price
      t.string :description
      t.string :year
      t.belongs_to :author
      t.belongs_to :collection
    end
  end
end
