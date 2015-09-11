class ProductsController < ApplicationController
  before_action :require_admin
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_admin, only: [:show_products]

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
    @product = Product.new(name: product_params[:name], description: product_params[:description], product_type: product_params[:product_type],
      dimensions: product_params[:dimensions], weight: product_params[:weight], material: product_params[:material], product_code: product_params[:product_code],
      is_new_release: product_params[:is_new_release], collection_id: product_params[:collection_id], sub_collection_id: product_params[:sub_collection_id])
    respond_to do |format|
      if product_params[:product_images_attributes]
        product_params[:product_images_attributes].each do |pia|
          @product_image = ProductImage.new(product_image: pia[:product_image], product_id: Product.last.id+1)
          if not @product_image.valid?
            format.html { render :new }
            format.json { render json: @product_image.errors, status: :unprocessable_entity }
            break
          end
        end
      end
      if @product.save
        # if product_params[:product_images_attributes]
        #   product_params[:product_images_attributes].each do |pi|
        #     @product.product_images.create(product_image: pi[:product_image])
        #   end
        # end
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
        # if product_params[:product_images_attributes]
        #   product_params[:product_images_attributes].each do |pi|
        #     # @product.product_images.create(product_image: pi[:product_image])
        #     product_image_aux = ProductImage.new(product_image: pi[:product_image], product: @product)
        #     byebug
        #     product_image_aux.save
        #   end
        # end
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

  def destroy_image
    @product_image = ProductImage.find_by_id(params[:id])
    @product_image.destroy
    respond_to do |format|
      format.html { redirect_to :action => "edit", :id => @product_image.product_id, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_all_products
    @products = Product.all

    @product_image_urls = []

    @products.each do |p|
      p_image_aux = []
      p.product_images.each do |i|
        p_image_aux.push(i.product_image.url(:large))
      end
      @product_image_urls.push(p_image_aux)
    end
  end

  def show_products_by_type
    @products = Product.where(product_type: params[:type].singularize)

    @product_image_urls = []

    @products.each do |p|
      p_image_aux = []
      p.product_images.each do |i|
        p_image_aux.push(i.product_image.url(:large))
      end
      @product_image_urls.push(p_image_aux)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :product_type, :dimensions, :weight, :material,
        :product_code, :is_new_release, :collection, :collection_id,
        :sub_collection, :sub_collection_id, product_images_attributes: [:product_image, :product, :product_id])
    end

    # def product_images_params
    #   params.require(:product).permit(product_images_attributes: [:product_image])
    # end
end
