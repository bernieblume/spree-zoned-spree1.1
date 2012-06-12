module Spree::Zoned
  class Product < ActiveRecord::Base
    attr_accessible :orderno
    belongs_to :country
    belongs_to :product
  end
end
