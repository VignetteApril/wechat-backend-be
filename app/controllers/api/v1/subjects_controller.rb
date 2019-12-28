class Api::V1::SubjectsController < Api::V1::BaseController
  def show
    @subject = Subject.find params[:id]
  end
end
