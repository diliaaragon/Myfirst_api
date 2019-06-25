class CreateJoinTableBooksGenres < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :genres do |t|
      t.references :book, foreign_key: true
      t.references :genre, foreign_key: true
    end
  end
end
