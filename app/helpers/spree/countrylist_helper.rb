#module Spree
#  BaseHelper.module_eval do
    module CountrylistHelper
      def countrylist
        @zonedCountrylist ||= Country.order :name
      end
    end
#  end
#end
