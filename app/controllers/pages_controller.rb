class PagesController < ApplicationController
    include CurrentCart
    before_action :set_cart


    def groceries
        @products = Product.order(:created_at)
    end

    def ready
        @products = Product.order(:created_at)
    end


end
