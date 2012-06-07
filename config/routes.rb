Spree::Core::Engine.routes.draw do
  match '/zonedcs' => "spree_zoned#countryselect"
end
