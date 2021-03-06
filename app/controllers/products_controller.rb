class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_business!, only: [:new, :edit, :create]
  # GET /products
  # GET /products.json
  def index
    if params[:search]
      @products = Product.where('title LIKE ?', "%#{params[:search]}%")
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {
        send_data @product.receipt.render,
          filename: "#{@product.created_at.strftime("%Y-%m-%d")}-ozfeed-receipt.pdf",
          type: "application/pdf",
          disposition: :inline
      }
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    
    @product = Product.new(product_params)
    @product.business_id = current_business.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:search, :title, :description, :image, :length, :width, :height, :cost_price, :category)
    end
end
