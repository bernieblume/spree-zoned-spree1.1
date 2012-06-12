module SpreeZoned
  module Generators
    class InstallGenerator < Rails::Generators::Base
    
      source_root File.expand_path("../assets", __FILE__)

      def add_javascripts
        res = ask 'Would you like to append spree_zoned to your js manifests now?\n(only answer no if you you\'ve already done it) [Y/n]'
        if res == '' || res.downcase == 'y'
          append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_zoned\n"
          append_file 'app/assets/javascripts/admin/all.js', "//= require admin/spree_zoned\n"
        end
      end

      def add_stylesheets
        res = ask 'Would you like to inject spree_zoned into your css manifests now?\n(only answer no if you you\'ve already done it) [Y/n]'
        if res == '' || res.downcase == 'y'
          inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_zoned\n", :before => /\*\//, :verbose => true                
          inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/spree_zoned\n", :before => /\*\//, :verbose => true
        end
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_zoned'
      end

      def run_migrations
         res = ask 'Would you like to run the migrations now? [Y/n]'
         if res == '' || res.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skipping rake db:migrate, don\'t forget to run it!'
         end
      end
    
      private
    
      def copyasset(filename)
        if copy_file "#{filename}", "app/assets/#{filename}"
          puts "Copied #{filename} into app/assets/#{filename}\n" 
        else
          puts "[Failed] File copying #{filename} into app/assets/#{filename}\n"
        end
      end
    
    end
  end
end
