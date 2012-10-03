module Spree
  Order.class_eval do

    attr_accessor :accept
    attr_accessible :accept

    validates :accept, :presence => true, :if => :address?

  end
end