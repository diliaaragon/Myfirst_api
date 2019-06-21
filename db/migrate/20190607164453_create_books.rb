class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :presentation
      t.integer :edition, null: false
      t.string :language, null: false
      t.integer :number_of_pages
      t.integer :ISBN, null: false

      t.timestamps
    end
  end
end
