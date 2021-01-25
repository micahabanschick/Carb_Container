class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :minutes
      t.string :intensity
      t.integer :calories_burned

      t.timestamps
    end
  end
end
