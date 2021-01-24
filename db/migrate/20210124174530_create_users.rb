class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :weight
      t.integer :height
      t.string :lifestyle

      t.timestamps
    end
  end
end
