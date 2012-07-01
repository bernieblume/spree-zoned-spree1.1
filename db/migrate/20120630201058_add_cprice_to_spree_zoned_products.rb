class AddCpriceToSpreeZonedProducts < ActiveRecord::Migration
  def change
    add_column :spree_zoned_products, :cprice, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
  end
end
