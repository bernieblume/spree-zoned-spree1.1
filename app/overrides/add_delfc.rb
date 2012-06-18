Deface::Override.new(
  :name          => "add_delfc",
  :virtual_path  => "spree/admin/products/index",
  :insert_bottom => "[data-hook='admin_products_index_row_actions']",
  :partial       => "spree/admin/zoned/delfc",
)
