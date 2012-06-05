module Spree
  BaseHelper.module_eval do
    def countrylist
      @zonedCountrylist ||= Country.order :name
    end
  end
end
