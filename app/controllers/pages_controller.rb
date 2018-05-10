class PagesController < ApplicationController
    include CurrentCart
    before_action :set_cart


    def groceries
        @products = Product.order(:created_at)
    end

    def ready
        @products = Product.order(:created_at)
    end

    def current_listings
        @products = current_business.products
    end
    def past_listings
        @products = current_business.products
    end
end
