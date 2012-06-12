module Spree
  
  module Admin
  
    module Zoned

      class ZonedController < BaseController

        def setcountry
          respond_to do |format|
            format.js do
              @current_country = params[:id]
              render :nothing => true
            end
          end
        end

      end
      
    end
    
  end

end
