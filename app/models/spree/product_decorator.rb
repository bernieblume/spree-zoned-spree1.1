module Spree
  Product.class_eval do
    
    def incountry?(country)
      clist = Spree::Zoned::Product.where "spree_product_id = ? AND spree_country_id = ?", id, country
      clist == [] || clist[0].orderno >= 0
    end
    
    def delfrom(country)
      clist = Spree::Zoned::Product.where "spree_product_id = ? AND spree_country_id = ?", id, country
      if clist == []
        zp = Spree::Zoned::Product.new
        zp.spree_country_id = country
        zp.spree_product_id = id
      else
        zp = clist[0]
      end
      zp.orderno = -1
      zp.save!
    end
    
  end
end
