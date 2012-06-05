Deface::Override.new(
  :name          => "add_country_selectbox",
  :virtual_path  => "spree/layouts/spree_application",
  :insert_before => "div#top-nav-bar",
  :partial       => "spree/zoned/countryselect",
)