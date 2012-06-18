Spree::Core::Engine.routes.draw do
  match '/zonedcs' => "zoned#setcountry"
  namespace :admin do
    match '/zonedcs' => "zoned#setcountry"
    match '/products/:id/zoneddfc' => "products#deletefc", :via => :delete
  end
end
