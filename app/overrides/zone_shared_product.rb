Deface::Override.new(
  :name             => "zone_shared_product",
  :virtual_path     => "spree/shared/_products",
  :replace_contents => "[data-hook='products_list_item']",
  :partial          => "spree/shared/products_list_item",
)
