class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :brand
      t.integer :carb_count
      t.integer :fiber_count
      t.integer :protein_count
      t.integer :fat_count
      t.integer :calorie_count

      t.timestamps
    end
  end
end
