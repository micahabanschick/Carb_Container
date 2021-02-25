class AddConsumedToUserFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :user_foods, :consumed, :boolean, default: false
  end
end
