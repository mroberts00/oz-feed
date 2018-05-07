class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :business
    has_many :line_items
    before_destroy :ensure_not_referenced_by_any_line_item

    def price
        price = 5
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
