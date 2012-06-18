module Spree
  class ZonedController < BaseController
    def setcountry
      respond_to do |format|
        format.js do
          session[:zoned] ||= {}
          session[:zoned][:current_country] = params[:id]
        end
      end
    end
  end
end
