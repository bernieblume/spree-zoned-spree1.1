module Spree
  module Admin  
    class ZonedController < BaseController
      def setcountry
        respond_to do |format|
          format.js do
            session[:zoned] ||= {}
            session[:zoned][:prd_country] = params[%s{sel-prd-country}]
            #render :nothing => true
          end
        end
      end
    end      
  end
end
