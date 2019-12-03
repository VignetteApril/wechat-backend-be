class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy, :subjects]
  skip_before_action :authorize, only: [:subjects]
  skip_before_action :can, only: [:subjects]

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all.order(order_no: :asc)
    @grade = params[:grade_id] ? Grade.find_by_id(params[:grade_id]) : @grades.first
    @subjects_data = @grade.nil? ? Subject.none : @grade.subjects
    @subjects = initialize_grid(@subjects_data, name: 'subjects', per_page: 1000)
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_path, notice: '年级已经被成功的创建了！' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grades_path, notice: '年级已经被成功更新了！' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /grades/1/subjects.json
  def subjects
    @subjects = @grade.subjects

    render json: { subjects: @subjects, message: '数据请求成功！', code: 0 }.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:name, :order_no)
    end
end
