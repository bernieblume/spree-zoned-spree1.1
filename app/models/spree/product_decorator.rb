module Spree
  Product.class_eval do
    
    def incountry?(country)
      clist = Spree::Zoned::Product.where "spree_product_id = ? AND spree_country_id = ?", id, country
      clist == [] || clist[0].orderno >= 0
    end
    
    def delfrom(country)
      setorderno country, -1
    end
    
    def backtocountry(country)
      setorderno country, 0
    end

    def setprice(country, price)
      clist = Spree::Zoned::Product.where "spree_product_id = ? AND spree_country_id = ?", id, country
      if !clist || clist == []
        zp = Spree::Zoned::Product.new
        zp.spree_country_id = country
        zp.spree_product_id = id
        zp.orderno = 0
      else
        zp = clist[0]
      end
      zp.cprice = price
      zp.save
    end

  protected

    def setorderno(country, ono)
      clist = Spree::Zoned::Product.where "spree_product_id = ? AND spree_country_id = ?", id, country
      if clist == []
        zp = Spree::Zoned::Product.new
        zp.spree_country_id = country
        zp.spree_product_id = id
      else
        zp = clist[0]
      end
      zp.orderno = ono
      zp.save
    end

  end
end
