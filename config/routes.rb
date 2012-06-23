Spree::Core::Engine.routes.draw do
  match '/zonedcs' => "zoned#setcountry"
  namespace :admin do
    match '/zonedcs' => "zoned#setcountry"
    match '/products/reorder' => "zoned#reorder", :via => :post
    match '/products/:id/zoneddfc' => "products#deletefc", :via => :delete
    match '/products/:id/zonedbtc' => "products#backtocountry", :via => :put
  end
end
