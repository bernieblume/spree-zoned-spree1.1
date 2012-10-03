module Spree
  BaseHelper.module_eval do

    def countrylist
      @zonedCountrylist ||= Country.order :name
    end

    def hlpAvailLangs(country)
      Rails.configuration.availableLanguages[country] || [["English", :en]]
    end

  end
end
