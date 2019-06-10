class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :name
      t.integer :foundation
      t.string :country

      t.timestamps
    end
  end
end
