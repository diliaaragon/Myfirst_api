class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :presentation
      t.integer :edition
      t.string :language
      t.integer :number_of_pages
      t.integer :ISBN

      t.timestamps
    end
  end
end
