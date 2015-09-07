class ProductsController < ApplicationController
  before_action :require_admin
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product_images = @product.product_images.all
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.product_images.build
  end

  # GET /products/1/edit
  def edit
    @product_images = @product.product_images.all
    @product.product_images.build
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        if not product_images_params[:product_images_attributes].nil?
          product_images_params[:product_images_attributes].each do |pi|
            @product.product_images.create(product_image: pi[:product_image])
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        @product.product_images.build
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
        if not product_images_params[:product_images_attributes].nil?
          product_images_params[:product_images_attributes].each do |pi|
            @product.product_images.create(product_image: pi[:product_image])
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        @product.product_images.build
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

  def destroy_image
    @product_image = ProductImage.find_by_id(params[:id])
    @product_image.destroy
    respond_to do |format|
      format.html { redirect_to :action => "edit", :id => @product_image.product_id, notice: 'Product was successfully destroyed.' }
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
      params.require(:product).permit(:name, :description, :type, :dimensions, :weight, :material,
        :product_code, :is_new_release, :collection, :collection_id, :sub_collection, :sub_collection_id,)
    end

    def product_images_params
      params.require(:product).permit(product_images_attributes: [:product_image])
    end
end
