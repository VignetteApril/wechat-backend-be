class TextSettingsController < ApplicationController
  before_action :set_text_setting, only: [:show, :edit, :update, :destroy]

  # GET /text_settings
  # GET /text_settings.json
  def index
    @text_settings = initialize_grid( TextSetting, per_page: 20,
                                                   order_direction: 'asc',
                                                   name: 'text_settings' )
  end

  # GET /text_settings/1
  # GET /text_settings/1.json
  def show
  end

  # GET /text_settings/new
  def new
    @text_setting = TextSetting.new
  end

  # GET /text_settings/1/edit
  def edit
  end

  # POST /text_settings
  # POST /text_settings.json
  def create
    @text_setting = TextSetting.new(text_setting_params)

    respond_to do |format|
      if @text_setting.save
        format.html { redirect_to text_settings_url, notice: 'Text setting was successfully created.' }
        format.json { render :show, status: :created, location: @text_setting }
      else
        format.html { render :new }
        format.json { render json: @text_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /text_settings/1
  # PATCH/PUT /text_settings/1.json
  def update
    respond_to do |format|
      if @text_setting.update(text_setting_params)
        format.html { redirect_to text_settings_url, notice: 'Text setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @text_setting }
      else
        format.html { render :edit }
        format.json { render json: @text_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_settings/1
  # DELETE /text_settings/1.json
  def destroy
    @text_setting.destroy
    respond_to do |format|
      format.html { redirect_to text_settings_url, notice: 'Text setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_setting
      @text_setting = TextSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_setting_params
      params.require(:text_setting).permit(:content, :content_type)
    end
end
