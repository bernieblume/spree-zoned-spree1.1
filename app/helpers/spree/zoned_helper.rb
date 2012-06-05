module Spree
  module ZonedHelper
    def countrylist
      @zonedCountrylist ||= Country.order_by_name
    end
  end
end
