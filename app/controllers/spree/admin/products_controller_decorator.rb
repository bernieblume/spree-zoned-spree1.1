module Spree
  module Admin
    ProductsController.class_eval do
      
      before_filter :filter_countries, :only => :index
      
      def deletefc
        country = session[:zoned] && session[:zoned][:prd_country]
        @product.delfrom country.to_i if country
        respond_to do |format|
          format.html { redirect_to collection_url }
          format.js  { render :nothing => true }
        end
      end
      
    protected
      
      def filter_countries
        country = session[:zoned] && session[:zoned][:prd_country]
        if country
          collection # returns immediately if already done
          newcoll = @collection.select { |p| p.incountry? country.to_i }
          @collection = newcoll
        end
      end
    
    end
  end
end
