class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
	# before_action :is_merchant, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: %i[ show edit update destroy ]
  

  # GET /products or /products.json
  def index
      @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

 
  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def listing
    @product = Product.all
  end
  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_product
      if current_user && current_user.has_role?(:merchant)
        @product = Product.find(params[:id])
      else
       redirect_to product_path
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :availability, :category, :user_id, images: [])
    end

    
end
