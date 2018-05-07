class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :donor
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def self.recent(max = 5)
    limit(max).order(created_at: :desc)
  end
end
