class SubjectsController < ApplicationController
  include Wechat
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :destroy_detail_imgs, :generate_qr_code_image]
  before_action :set_grade, only: [:new, :edit, :create, :update, :destroy_detail_imgs, :generate_qr_code_image]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = initialize_grid( Subject, per_page: 20,
                                          order_direction: 'asc',
                                          name: 'subjects' )
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = @grade.subjects.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = @grade.subjects.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to grades_path, notice: '科目已经成功的创建了！' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to grades_path, notice: '科目已经成功的更新了！' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to grades_path, notice: '科目已经成功的删除了！' }
      format.json { head :no_content }
    end
  end

  def destroy_detail_imgs
    @subject.detail_imgs.purge
    respond_to do |format|
      format.html { redirect_to grade_subject_url(@grade, @subject), notice: '科目的详情图片已经删除了！' }
      format.json { head :no_content }
    end
  end

  def generate_qr_code_image
    res = get_qr_code_image 'pages/subject/subject', "subject_id=#{@subject.id}"
    if res["errcode"].nil?
      @subject.qrcode.attach io: StringIO.new(res["buffer"]),
                             content_type: "image/jpg"
      return_message = "二维码已经生成！"
      alert_type = 'notice'
    else
      return_message = "二维码生成失败：#{res["errmsg"]}"
      alert_type = 'alert'
    end

    respond_to do |format|
      format.html { redirect_to grade_subject_url(@grade, @subject), alert_type.to_sym => return_message }
      format.json { head :no_content }
    end
  end

  private
    def set_grade
      @grade = Grade.find(params[:grade_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:grade_id,
                                      :name,
                                      :code_prefix,
                                      :order_no,
                                      :description,
                                      :courses_page_cover,
                                      :main_page_cover,
                                      :subject_type,
                                      detail_imgs: [])
    end
end
