class StaticImagesController < ApplicationController
  before_action :set_static_image, only: [:show, :edit, :update, :destroy]

  # GET /static_images
  # GET /static_images.json
  def index
    @static_images = initialize_grid( StaticImage, per_page: 20,
                                                   order_direction: 'asc',
                                                   name: 'static_images',
                                                   enable_export_to_csv: true,
                                                   csv_file_name: 'static_images' )
  end

  # GET /static_images/1
  # GET /static_images/1.json
  def show
  end

  # GET /static_images/new
  def new
    @static_image = StaticImage.new
  end

  # GET /static_images/1/edit
  def edit
  end

  # POST /static_images
  # POST /static_images.json
  def create
    @static_image = StaticImage.new(static_image_params)

    respond_to do |format|
      if @static_image.save
        format.html { redirect_to static_images_url, notice: 'Static image was successfully created.' }
        format.json { render :show, status: :created, location: @static_image }
      else
        format.html { render :new }
        format.json { render json: @static_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /static_images/1
  # PATCH/PUT /static_images/1.json
  def update
    respond_to do |format|
      if @static_image.update(static_image_params)
        format.html { redirect_to static_images_url, notice: 'Static image was successfully updated.' }
        format.json { render :show, status: :ok, location: @static_image }
      else
        format.html { render :edit }
        format.json { render json: @static_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /static_images/1
  # DELETE /static_images/1.json
  def destroy
    @static_image.destroy
    respond_to do |format|
      format.html { redirect_to static_images_url, notice: 'Static image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static_image
      @static_image = StaticImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def static_image_params
      params.require(:static_image).permit(:img_type, :order_no, :img)
    end
end
