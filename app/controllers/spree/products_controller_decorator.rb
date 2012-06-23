module Spree
  ProductsController.class_eval do
  
	def index
	  p = params ? params : {}
	  country = session[:zoned] && session[:zoned][:current_country]
	  @searcher = Spree::Config.searcher_class.new(p.merge(country ? {zoned_country: country} : {}))
	  @products = @searcher.retrieve_products
	  respond_with(@products)
	end

  end
end
