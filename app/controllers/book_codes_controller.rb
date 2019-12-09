class BookCodesController < ApplicationController
  before_action :set_book_code, only: [:show, :edit, :update, :destroy]

  # GET /book_codes
  # GET /book_codes.json
  def index
    @book_codes = initialize_grid( BookCode, per_page: 20,
                                             name: 'book_codes',
                                             enable_export_to_csv: true,
                                             csv_file_name: 'book_codes',
                                             include: [:subject, { subject: :grade }])

    export_grid_if_requested('book_codes' => 'book_codes_grid')
  end

  # GET /book_codes/1
  # GET /book_codes/1.json
  def show
  end

  # GET /book_codes/new
  def new
    @grades = Grade.all
  end

  # GET /book_codes/1/edit
  def edit
  end

  # POST /book_codes
  # POST /book_codes.json
  def create
    @book_code = BookCode.new(book_code_params)

    respond_to do |format|
      if @book_code.save
        format.html { redirect_to @book_code, notice: '学习码已经成功的创建了！' }
        format.json { render :show, status: :created, location: @book_code }
      else
        format.html { render :new }
        format.json { render json: @book_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_codes/1
  # PATCH/PUT /book_codes/1.json
  def update
    respond_to do |format|
      if @book_code.update(book_code_params)
        format.html { redirect_to @book_code, notice: '学习码已经成功的更新！' }
        format.json { render :show, status: :ok, location: @book_code }
      else
        format.html { render :edit }
        format.json { render json: @book_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_codes/1
  # DELETE /book_codes/1.json
  def destroy
    @book_code.destroy
    respond_to do |format|
      format.html { redirect_to book_codes_url, notice: '学习码已经成功删除了！' }
      format.json { head :no_content }
    end
  end

  # POST /book_codes/generate_book_codes
  # params grade_id     年级的id
  # params subject_id   科目的id
  # params code_num     要生成code的条数
  def generate_book_codes
    code_num = book_code_params[:code_num]
    subject_id  = book_code_params[:subject_id]
    grade_id = book_code_params[:grade_id]

    if subject_id.present?
      subject = Subject.find subject_id
      GenerateBookCodeJob.perform_later code_num, subject
      redirect_to book_codes_url, notice: '书码生成任务已经开始进行，请稍等...'
    elsif grade_id.present?
      grade = Grade.find grade_id
      last_book_code = BookCode.last
      batch_code = last_book_code.nil? ? 1 : last_book_code.batch_code + 1
      
      grade.subjects.each do |subject|
        GenerateBookCodeJob.perform_later code_num, subject, batch_code
      end
      redirect_to book_codes_url, notice: '书码生成任务已经开始进行，请稍等...'
    else
      redirect_to new_book_code_url, alert: '请选择年级和科目, 以及生成条目.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_code
      @book_code = BookCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_code_params
      params.require(:book_code).permit(:code, :customer_id, :course_id, :subject_id, :grade_id, :code_num)
    end
end
