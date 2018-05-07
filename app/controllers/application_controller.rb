class ApplicationController < ActionController::Base
    def recent_orders
        @recent_orders = Order.recent
      end   

end

