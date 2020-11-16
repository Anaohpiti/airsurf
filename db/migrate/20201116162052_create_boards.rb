class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.text :description
      t.string :location
      t.float :height
      t.float :volume
      t.string :brand
      t.string :condition
      t.integer :price_per_day
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
