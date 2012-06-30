Deface::Override.new(
  :name             => "replace_admin_product_right",
  :virtual_path     => "spree/admin/products/_form",
  :replace_contents => "[data-hook='admin_product_form_right']",
  :partial          => "spree/admin/zoned/productright",
)