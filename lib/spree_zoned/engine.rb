module SpreeZoned
  class Engine < Rails::Engine
    engine_name 'spree_zoned'
    isolate_namespace Spree

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
    
    initializer "spree.zoned.countrylists" do
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
      # of locales that are pobbile to select for that specific country.
      # For all countries not included in ZONED_COMMON_COUNTRIES, the locale will automatically be set to :en.
      # The first locale listed for each country is considered that countrie's default locale.
      #
      ZONED_COMMON_LOCALES =
      [
        [:en], # United States
        [:de, :en], # Germany
        [:de, :en], # Austria
        [:de, :en], # Switzerland
        [:nl, :en], # Netherlands
        [:nl, :de, :en], # Belgium
        [:de, :en], # Luxembourg
      ]
      Rails.configuration.commonCountriesForSelect = ZONED_COMMON_COUNTRIES.map do |id|
        [ Spree::Country.find_by_id(id).name, id ]
      end
      puts "Yippie, zoned initializer finished :-)"
    end
  end
end
