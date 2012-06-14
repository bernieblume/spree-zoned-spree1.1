Deface::Override.new(
  :name          => "add_js_prd_index",
  :virtual_path  => "spree/admin/products/index",
  :insert_before => "[data-hook='toolbar']",
  :text          => "<%= javascript_include_tag 'admin/zoned' %>",
)
