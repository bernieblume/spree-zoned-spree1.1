Deface::Override.new(
  :name          => "add_prd_country",
  :virtual_path  => "spree/admin/layouts/admin",
  :insert_before => "li#new_product_link",
  :partial       => "spree/admin/zoned/prd_country",
)
