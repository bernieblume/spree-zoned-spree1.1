module Spree
  #BaseHelper.module_eval do
  module Zoned
    module CountrylistHelper
      def countrylist
        @zonedCountrylist ||= Country.order :name
      end
    end
  end
end
