module Spree
  HomeController.class_eval do
  
    def index
      p = params ? params : {}
      @searcher = Spree::Config.searcher_class.new(p.merge({zoned_country: (session[:zoned] && session[:zoned][:current_country]) || {}}))
      @products = @searcher.retrieve_products
      respond_with(@products)
    end

  end
end
