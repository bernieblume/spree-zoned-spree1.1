module Spree
  class ZonedController < BaseController

    def availLangs(country)
      Rails.configuration.availableLanguages[country] || ["English", "en"]
    end

    def setcountry
      respond_to do |format|
        format.js do
          session[:zoned] ||= {}
          c = session[:zoned][:current_country] = params[:id]
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
