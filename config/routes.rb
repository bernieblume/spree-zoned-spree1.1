Spree::Core::Engine.routes.draw do
  match '/zonedcs' => "zoned#setcountry"
end
