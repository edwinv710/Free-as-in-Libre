class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_id
      t.integer :depth
      t.boolean :is_active
      t.datetime :created_at
      t.datetime :updated_at


      t.timestamps
    end
  end
end
