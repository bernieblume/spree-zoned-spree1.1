module Spree
  module Zoned
    class Engine < Rails::Engine
      engine_name 'spree_zoned'
      isolate_namespace Spree::Zoned

      config.autoload_paths += %W(#{config.root}/lib)

      # use rspec for tests
      config.generators do |g|
        g.test_framework :rspec
      end

      # load all decorators
      def self.activate
        if Spree::Config.instance
          Spree::Config[:auto_capture] = true
        end
        Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
