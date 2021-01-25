class AddUserIdToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :user_id, :integer
  end
end
