class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.integer :price_in_cents
      t.integer :servingQuantity

      t.timestamps null: false
    end
  end
end
