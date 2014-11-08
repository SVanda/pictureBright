class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :user_id
      add_index :assets, :user_id
      t.timestamps
    end
  end
end
