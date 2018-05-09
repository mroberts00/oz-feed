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

  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "your OzFeed Donation",
      company: {
        name: "OzFeed",
        address: "37 Pelican Flats\nFloor 295\nSydney, \nNSW 10012,\n AUSTRALIA",
        email: "ozfeed@gmail.com",
        logo: Rails.root.join("app/assets/images/rubiks-cube.jpeg")
      },
      line_items: [
        ["Date",           created_at.strftime("%e %b %Y").to_s],
        ["Account Billed", "#{self.donor.donor_profile.first_name} #{self.donor.donor_profile.last_name}"],
        ["Product",        "Donation"],
        ["Amount",         "$#{self.price.to_i}.00"],
        ["Transaction ID", self.id]
      ],
      # font: {
      #   bold: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic-Bold.ttf'),
      #   normal: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic.ttf'),
      # }
    )
  end
end

