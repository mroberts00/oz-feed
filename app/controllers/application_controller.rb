class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery
    def recent_orders
        @recent_orders = Order.recent
      end   

end

