Spree::Core::Engine.routes.draw do
  match '/zonedcs' => "zoned#setcountry"
  namespace :admin do
    match '/zonedcs' => "zoned#setcountry"
  end
end
