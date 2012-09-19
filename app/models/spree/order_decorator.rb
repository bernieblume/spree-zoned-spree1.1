module Spree
  Order.class_eval do

    attr_accessible :accept

  	#validates :accept, :presence => true

  end
end