class BookCodesController < ApplicationController
  before_action :set_book_code, only: [:show, :edit, :update, :destroy]

  # GET /book_codes
  # GET /book_codes.json
  def index
    @book_codes = initialize_grid( BookCode, per_page: 20,
                                             name: 'book_codes',
                                             enable_export_to_csv: true,
                                             csv_file_name: 'book_codes' )
  end

  # GET /book_codes/1
  # GET /book_codes/1.json
  def show
  end

  # GET /book_codes/new
  def new
    @book_code = BookCode.new
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
        format.html { redirect_to @book_code, notice: 'Book code was successfully created.' }
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
        format.html { redirect_to @book_code, notice: 'Book code was successfully updated.' }
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
      format.html { redirect_to book_codes_url, notice: 'Book code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_code
      @book_code = BookCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_code_params
      params.require(:book_code).permit(:code, :customer_id, :course_id)
    end
end
