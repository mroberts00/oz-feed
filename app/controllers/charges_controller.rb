class ChargesController < ApplicationController
    include CurrentCart

    before_action :find_cart
    
    def create

        # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        token = params[:stripeToken]
        @amount = @cart.total_price.to_i*100

        charge = Stripe::Charge.create({
            amount: @amount,
            currency: 'aud',
            description: 'Example charge',
            source: token,
        
        })
        
        Order.new[:params]

        redirect_to new_order_path, notice: "Payment Successful"
    end

    private

    def find_cart
        @cart = Cart.find(session[:cart_id])
    end

end