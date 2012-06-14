Deface::Override.new(
  :name          => "add_prd_handles",
  :virtual_path  => "spree/admin/products/index",
  :insert_top    => "[data-hook='admin_products_index_rows'] > td:first-child",
  :text          => '<span class="handle"></span>&nbsp;',
)
