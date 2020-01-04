class Api::V1::SubjectsController < Api::V1::BaseController
  before_action :set_customer, only: [:my_subjects, :check_subject_owner, :my_subjects]

  def show
    @subject = Subject.find params[:id]
  end

  def my_subjects
    @subjects = @customer.subjects.group_by(&:grade).sort_by{ |key, _| key.order_no  }
  end

  # 检查当前用户是否拥有当前subject
  def check_subject_owner
    subject_id = params[:subject_id]
    @rs_bool = @customer.subjects.map(&:id).include? subject_id.to_i
    if @rs_bool
      @code = 0
      @message = '您拥有当前课程的权限'
    else
      @code = 1
      @message = '您还没有拥有当前课程的权限，请输入学习码获取.'
    end
  end
end
