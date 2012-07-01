Deface::Override.new(
  :name             => "replace_index_rows",
  :virtual_path     => "spree/admin/products/index",
  :replace_contents => "[data-hook='admin_products_index_rows']",
  :partial          => "spree/admin/zoned/index_rows",
)
