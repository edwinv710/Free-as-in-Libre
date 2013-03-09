class DestroyProductCategory < ActiveRecord::Migration
  def up
    drop_table :categories_products
  end

  def down
  end
end
