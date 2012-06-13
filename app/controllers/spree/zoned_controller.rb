module Spree
  class ZonedController < BaseController
    def setcountry
      respond_to do |format|
        format.js do
          session[:zoned] ||= {}
          session[:zoned][:current_country] = params[:id]
          render :nothing => true
        end
      end
    end
  end
end
