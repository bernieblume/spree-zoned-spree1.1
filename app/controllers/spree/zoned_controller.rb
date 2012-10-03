module Spree
  class ZonedController < BaseController

    def availLangs(country)
      Rails.configuration.availableLanguages[country] || [["English", :en]]
    end

    def setcountry
      respond_to do |format|
        format.js do
          if params[:order] && params[:order][:bill_address_attributes] && params[:order][:bill_address_attributes][:country_id]
            i = params[:order][:bill_address_attributes][:country_id].to_i.abs
          else
            i = params[:id].to_i.abs
          end
          i = -i if (Rails.application.config.commonCountriesForSelect.map { |a| a[1] }).include? -i
          i = i.to_s
          session[:zoned] ||= {}
          c = session[:zoned][:current_country] = i
          c = c.to_i
          session[:zoned][:current_language] = (availLangs(c) && availLangs(c)[0][1]) || "en"
        end
      end
    end

    def setlanguage
      respond_to do |format|
        format.js do
          session[:zoned] ||= {}
          session[:zoned][:current_language] = params[:lgid]
        end
      end
    end

  end
end
