module Spree
  module Admin  
    class ZonedController < BaseController

      def setcountry
        respond_to do |format|
          format.js do
            session[:zoned] ||= {}
            session[:zoned][:prd_country] = params[%s{sel-prd-country}]
          end
        end
      end

      def reorder
        country = session[:zoned] && session[:zoned][:prd_country]
        return if !country || country.to_i >= 0
        country = country.to_i
        params[:positions].each do |id, index|
          Spree::Zoned::Product.find_or_create_by_spree_product_id_and_spree_country_id(id, country).update_attributes :orderno => index.to_i
        end
        respond_to do |format|
          format.html { redirect_to admin_products_url }
          format.js  { render :text => 'Ok' }
        end
      end

    end      
  end
end
