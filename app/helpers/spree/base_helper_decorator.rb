module Spree
  BaseHelper.module_eval do
    def countrylist
      @zonedCountrylist ||= Country.order_by_name
    end
  end
end
