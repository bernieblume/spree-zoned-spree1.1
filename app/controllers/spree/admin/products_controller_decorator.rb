module Spree
  module Admin
    ProductsController.class_eval do
      
      def deletefc
        inorout(@product.method :delfrom)
      end
      
      def backtocountry
        inorout(@product.method :backtocountry)
      end

    protected

      def inorout(m)
        country = session[:zoned] && session[:zoned][:prd_country]
        m.call(country.to_i) if country
        respond_to do |format|
          format.html { redirect_to collection_url }
          format.js { render nothing: true }
        end
      end

    end
  end
end
