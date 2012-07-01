module Spree
  module Admin
    ProductsHelper.module_eval do

      def getCPrice(p)
      	c = session[:zoned] && session[:zoned][:prd_country]
      	c = c ? c.to_i : 0
      	return p.price if c == 0
      	zpl = Spree::Zoned::Product.where "spree_product_id = ? AND spree_country_id = ?", p.id, c
      	zpl == [] ? p.price : zpl[0].cprice
      end

    end
  end
end
