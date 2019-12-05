class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_grade, only: [:index, :new, :show, :edit, :update, :destroy, :create]
  before_action :set_subject, only: [:index, :new, :show, :edit, :update, :destroy, :create]

  # GET /courses
  # GET /courses.json
  def index
    @courses = initialize_grid( Course, per_page: 20,
                                        name: 'courses',
                                        enable_export_to_csv: false,
                                        csv_file_name: 'courses')
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = @subject.courses.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = @subject.courses.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to grade_subject_courses_url(@grade, @subject), notice: '课程视频已经被成功创建了！' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to grade_subject_courses_url(@grade, @subject), notice: '课程视频已经被成功更新了！' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to grade_subject_courses_url(@grade, @subject), notice: '课程视频已经被成功删除了！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def set_grade
      @grade = Grade.find(params[:grade_id])
    end

    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :subject_id, :video, :order_no)
    end
end
