class AddQuantityToUserFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :user_foods, :quantity, :integer
  end
end
