class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :imageSmall
      t.string :imageMedium
      t.string :imageLarge
      t.text :descShort
      t.text :descLong
      t.decimal :price, :scale => 2

      t.timestamps
    end
  end
end
