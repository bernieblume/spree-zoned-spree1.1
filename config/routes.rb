Spree::Core::Engine.routes.draw do
  match '/zonedcs' => "zoned#countryselect"
end
