Deface::Override.new(
  :name          => "add_js_prd_index",
  :virtual_path  => "spree/admin/products/index",
  :insert_before => "[data-hook='toolbar']",
  :partial       => "spree/admin/zoned/jstag",
)
