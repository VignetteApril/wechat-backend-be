class Api::V1::FeedbacksController < Api::V1::BaseController
  before_action :set_customer, only: [:create]

  def create
    _params = check_params
    @feedback = @customer.feedbacks.new(_params)

    respond_to do |format|
      if @feedback.save
        format.html { render nothing: true, layout: false, status: 200, content_type: 'text/html' }
        format.json { render json: { message: '保存成功', code: 0 }, status: :created }
      else
        format.html { render nothing: true, layout: false, status: 500, content_type: 'text/html' }
        format.json { render json: { message: '保存失败', code: 1 }, status: :unprocessable_entity }
      end
    end
  end

  private
    def check_params
      _params = params[:image] == 'undefined' ? { message: params[:message] } : { message: params[:message], image: params[:image] }
      _params
    end
end
