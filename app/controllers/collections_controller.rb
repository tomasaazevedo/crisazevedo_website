class CollectionsController < ApplicationController
  before_action :require_admin
  before_action :set_collection, only: [:show, :edit, :update, :destroy, :show_collection, :show_collections]
  skip_before_action :require_admin, only: [:show_collection, :show_collections]

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection_images = @collection.collection_images.all
  end

  # GET /collections/new
  def new
    @collection = Collection.new
    @collection.collection_images.build
  end

  # GET /collections/1/edit
  def edit
    @collection_images = @collection.collection_images.all
    @collection.collection_images.build
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        if not collection_images_params[:collection_images_attributes].nil?
          collection_images_params[:collection_images_attributes].each do |ci|
            @collection.collection_images.create(collection_image: ci[:collection_image])
          end
        end
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        @collection.collection_images.build
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        if not collection_images_params[:collection_images_attributes].nil?
          collection_images_params[:collection_images_attributes].each do |ci|
            @collection.collection_images.create(collection_image: ci[:collection_image])
          end
        end
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        @collection.collection_images.build
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_image
    @collection_image = CollectionImage.find_by_id(params[:id])
    @collection_image.destroy
    respond_to do |format|
      format.html { redirect_to :action => "edit", :id => @collection_image.collection_id, notice: 'Collection image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_collection
    @product_image_urls = []

    @collection.products.each do |p|
      p_image_aux = []
      p.product_images.each do |i|
        p_image_aux.push(i.product_image.url(:large))
      end
      @product_image_urls.push(p_image_aux)
    end
  end

  def show_collections
    @collections = Collection.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:name, :description)
    end

    def collection_images_params
      params.require(:collection).permit(collection_images_attributes: [:collection_image])
    end
end
