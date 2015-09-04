class CollectionImagesController < ApplicationController
  before_action :require_admin
  before_action :set_collection_image, only: [:show, :edit, :update, :destroy]

  # GET /collection_images
  # GET /collection_images.json
  def index
    @collection_images = CollectionImage.all
  end

  # GET /collection_images/1
  # GET /collection_images/1.json
  def show
  end

  # GET /collection_images/new
  def new
    @collection_image = CollectionImage.new
  end

  # GET /collection_images/1/edit
  def edit
  end

  # POST /collection_images
  # POST /collection_images.json
  def create
    @collection_image = CollectionImage.new(collection_image_params)

    respond_to do |format|
      if @collection_image.save
        format.html { redirect_to @collection_image, notice: 'Collection image was successfully created.' }
        format.json { render :show, status: :created, location: @collection_image }
      else
        format.html { render :new }
        format.json { render json: @collection_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_images/1
  # PATCH/PUT /collection_images/1.json
  def update
    respond_to do |format|
      if @collection_image.update(collection_image_params)
        format.html { redirect_to @collection_image, notice: 'Collection image was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_image }
      else
        format.html { render :edit }
        format.json { render json: @collection_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_images/1
  # DELETE /collection_images/1.json
  def destroy
    @collection_image.destroy
    respond_to do |format|
      format.html { redirect_to collection_images_url, notice: 'Collection image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_image
      @collection_image = CollectionImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_image_params
      params.require(:collection_image).permit(:collection_image, :collection_id)
    end
end
