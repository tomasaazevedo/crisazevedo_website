class SubCollectionImagesController < ApplicationController
  before_action :require_admin
  before_action :set_sub_collection_image, only: [:show, :edit, :update, :destroy]

  # GET /sub_collection_images
  # GET /sub_collection_images.json
  def index
    @sub_collection_images = SubCollectionImage.all
  end

  # GET /sub_collection_images/1
  # GET /sub_collection_images/1.json
  def show
  end

  # GET /sub_collection_images/new
  def new
    @sub_collection_image = SubCollectionImage.new
  end

  # GET /sub_collection_images/1/edit
  def edit
  end

  # POST /sub_collection_images
  # POST /sub_collection_images.json
  def create
    @sub_collection_image = SubCollectionImage.new(sub_collection_image_params)

    respond_to do |format|
      if @sub_collection_image.save
        format.html { redirect_to @sub_collection_image, notice: 'Sub collection image was successfully created.' }
        format.json { render :show, status: :created, location: @sub_collection_image }
      else
        format.html { render :new }
        format.json { render json: @sub_collection_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_collection_images/1
  # PATCH/PUT /sub_collection_images/1.json
  def update
    respond_to do |format|
      if @sub_collection_image.update(sub_collection_image_params)
        format.html { redirect_to @sub_collection_image, notice: 'Sub collection image was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_collection_image }
      else
        format.html { render :edit }
        format.json { render json: @sub_collection_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_collection_images/1
  # DELETE /sub_collection_images/1.json
  def destroy
    @sub_collection_image.destroy
    respond_to do |format|
      format.html { redirect_to sub_collection_images_url, notice: 'Sub collection image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_collection_image
      @sub_collection_image = SubCollectionImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_collection_image_params
      params.require(:sub_collection_image).permit(:sub_collection_image, :sub_collection_id)
    end
end
