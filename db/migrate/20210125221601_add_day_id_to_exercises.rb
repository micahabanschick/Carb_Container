class AddDayIdToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :day_id, :integer
  end
end
