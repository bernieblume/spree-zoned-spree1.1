Deface::Override.new(
  :name             => "replace_product_price",
  :virtual_path     => "spree/products/_cart_form",
  :replace_contents => "[data-hook='product_price']",
  :partial          => "spree/zoned/product_price",
)
