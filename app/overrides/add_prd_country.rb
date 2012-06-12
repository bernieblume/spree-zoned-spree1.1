Deface::Override.new(
  :name          => "add_prd_country",
  :virtual_path  => "spree/admin/products/index",
  :insert_before => "li#new_product_link",
  :partial       => "spree/admin/zoned/prd_country",
)
