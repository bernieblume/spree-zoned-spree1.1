class CreateSpreeZonedProducts < ActiveRecord::Migration
  def change
    create_table :spree_zoned_products do |t|
      t.integer :orderno
      t.references :spree_country
      t.references :spree_product

      t.timestamps
    end
  end
end
