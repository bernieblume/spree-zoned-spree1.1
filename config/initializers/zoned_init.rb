require "spree/zoned/search/base"

#
# ZONED_COMMON_COUNTRIES is the list of countries that will be separately listed
# in the beginning of the country select box for easy selection.
# Edit the list to your liking.
#    
ZONED_COMMON_COUNTRIES =
[
  214, # United States
  74, # Germany
  13, # Austria
  195, # Switzerland
  142, # Netherlands
  20, # Belgium
  117, # Luxembourg
]

#
# ZONED_COMMOM_LOCALES specifies - for each contry contained in ZONED_COMMON_COUNTRIES - a list (array)
# of locales that are possibile to select for that specific country.
# For all countries not included in ZONED_COMMON_COUNTRIES, the locale will automatically be set to :en.
# The first locale listed for each country is considered that countrie's default locale.
#
ZONED_COMMON_LOCALES =
{
  -214 => [:en], # United States
  -74  => [:de, :en], # Germany
  -13  => [:de, :en], # Austria
  -195 => [:de, :en], # Switzerland
  -142 => [:nl, :en], # Netherlands
  -20  => [:nl, :de, :en], # Belgium
  -117 => [:de, :en, :nl], # Luxembourg
}

Rails.configuration.commonCountriesForSelect = ZONED_COMMON_COUNTRIES.map do |id|
  [ Spree::Country.find_by_id(id).name, -id ]
end

Rails.configuration.availableLanguages = Hash[ZONED_COMMON_LOCALES.map { |c, lgs| [c, lgs.map { |l| [((l==:en ? "English" : (l==:de ? "Deutsch" : "Nederlands"))) ,l]}]}]

Spree::Config.searcher_class = Spree::Zoned::Search::Base
Spree::Config.admin_products_per_page = 64
Spree::PrintInvoice::Config[:print_invoice_logo_path] = "admin/bg/hau-to-logo-claim.png"
