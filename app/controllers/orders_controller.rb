class OrdersController < ApplicationController
  include CurrentCart
  layout "nocart"
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :authenticate_donor!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end



  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {
        send_data @order.receipt.render,
          filename: "#{@order.created_at.strftime("%Y-%m-%d")}-ozfeed-receipt.pdf",
          type: "application/pdf",
          disposition: :inline
      }
    end
  end

  def recent_orders
    @recent_orders = Order.order('created_at DESC').limit(3)
  end    

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.donor_id = current_donor.id
    @order.price = @cart.total_price
    respond_to do |format|
        if @order.save
         @order.line_items.each do |line|
            thing = Product.find(line.product_id)
            thing.sold = true
            thing.save
        end
        token = params[:stripeToken]
        @amount = @cart.total_price.to_i*100

        charge = Stripe::Charge.create({
            amount: @amount,
            currency: 'aud',
            description: 'Example charge',
            source: token,
        
        })
        
        Order.new[:params]

        redirect_to controller: 'orders', action: 'show', id: Order.last.id


        Cart.destroy(session[:cart_id])
        session[:cart_id]
        format.html 
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:donor_id, :anonymous)
    end


    def ensure_cart_isnt_empty
      if @cart.line_items.empty?
      redirect_to store_index_url, notice: 'Your cart is empty'
      end 
    end
end
