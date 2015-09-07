class SubCollectionsController < ApplicationController
  before_action :require_admin
  before_action :set_sub_collection, only: [:show, :edit, :update, :destroy]

  # GET /sub_collections
  # GET /sub_collections.json
  def index
    @sub_collections = SubCollection.all
  end

  # GET /sub_collections/1
  # GET /sub_collections/1.json
  def show
    @sub_collection_images = @sub_collection.sub_collection_images.all
  end

  # GET /sub_collections/new
  def new
    @sub_collection = SubCollection.new
    @sub_collection.sub_collection_images.build
  end

  # GET /sub_collections/1/edit
  def edit
    @sub_collection_images = @sub_collection.sub_collection_images.all
    @sub_collection.sub_collection_images.build
  end

  # POST /sub_collections
  # POST /sub_collections.json
  def create
    @sub_collection = SubCollection.new(sub_collection_params)

    respond_to do |format|
      if @sub_collection.save
        if not sub_collection_images_params[:sub_collection_images_attributes].nil?
          sub_collection_images_params[:sub_collection_images_attributes].each do |sci|
            @sub_collection.sub_collection_images.create(sub_collection_image: sci[:sub_collection_image])
          end
        end
        format.html { redirect_to @sub_collection, notice: 'Sub collection was successfully created.' }
        format.json { render :show, status: :created, location: @sub_collection }
      else
        @sub_collection.sub_collection_images.build
        format.html { render :new }
        format.json { render json: @sub_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_collections/1
  # PATCH/PUT /sub_collections/1.json
  def update
    respond_to do |format|
      if @sub_collection.update(sub_collection_params)
        if not sub_collection_images_params[:sub_collection_images_attributes].nil?
          sub_collection_images_params[:sub_collection_images_attributes].each do |sci|
            @sub_collection.sub_collection_images.create(sub_collection_image: sci[:sub_collection_image])
          end
        end
        format.html { redirect_to @sub_collection, notice: 'Sub collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_collection }
      else
        @sub_collection.sub_collection_images.build
        format.html { render :edit }
        format.json { render json: @sub_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_collections/1
  # DELETE /sub_collections/1.json
  def destroy
    @sub_collection.destroy
    respond_to do |format|
      format.html { redirect_to sub_collections_url, notice: 'Sub collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_image
    @sub_collection_image = SubCollectionImage.find_by_id(params[:id])
    @sub_collection_image.destroy
    respond_to do |format|
      format.html { redirect_to :action => "edit", :id => @sub_collection_image.sub_collection_id, notice: 'Sub-Collection image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_collection
      @sub_collection = SubCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_collection_params
      params.require(:sub_collection).permit(:name, :description, :collection, :collection_id)
    end

    def sub_collection_images_params
      params.require(:sub_collection).permit(sub_collection_images_attributes: [:sub_collection_image])
    end
end
