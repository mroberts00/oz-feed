class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :title, :description, :length, :height, :width, :cost_price, :image, presence: :true
    belongs_to :business
    has_many :line_items
    has_many :orders, through: :line_items
    before_destroy :ensure_not_referenced_by_any_line_item

    enum category: {
        "Grocery"          => 0,
        "Ready to Eat"    => 1,
    }
    def price
        (((self.length)*(self.height)*(self.width))/10000) + 20
    end

    def receipt
        Receipts::Receipt.new(
          id: id,
          product: "your OzFeed Donation",
          company: {
            name: "OzFeed",
            address: "37 Pelican Flats\nFloor 295\nSydney, \nNSW 10012,\n AUSTRALIA",
            email: "ozfeed@gmail.com",
            logo: Rails.root.join("app/assets/images/logo.png")
          },
          line_items: [
            ["Date",           created_at.strftime("%e %b %Y").to_s],
            ["Account Billed", "#{self.business.business_profile.name}"],
            ["Product",        "Donation"],
            ["Amount",         "$#{self.cost_price.to_i}.00"],
            ["Transaction ID", self.id]
          ],
          # font: {
          #   bold: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic-Bold.ttf'),
          #   normal: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic.ttf'),
          # }
        )
      end


    private
    #ensure taht there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, 'Line Items Present')
            throw :abort
        end
    end
end
