class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :business
    has_many :line_items
    has_many :orders, through: :line_items
    before_destroy :ensure_not_referenced_by_any_line_item


    def price
        (((self.length)*(self.height)*(self.width))/10000) + 20
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
