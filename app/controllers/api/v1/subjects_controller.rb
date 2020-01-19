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

  # 搜索分类三种类型
  # 只搜索年级
  # 只所搜科目
  # 年级科目都搜索
  def search
    key_words = params[:key_words]
    @message = '搜索的科目已经成功返回'
    @code = 0
    case key_words.size
    when 3
      grade = Grade.find_by_name(key_words)
      @subjects = grade.subjects
    when 2
      @subjects = Subject.where('name LIKE ?', "%#{key_words}%")
    when 5
      grade_name = key_words[0..2]
      subject_name = key_words[3..4]
      grade = Grade.find_by_name(grade_name)
      @subjects = grade.subjects.where('name LIKE ?', "%#{key_words}%")
    else
      @message = '请检测您搜索的关键词'
      @code = 1
    end

    @subjects = @subjects.nil? ? [] : @subjects.group_by(&:grade).sort_by{ |key, _| key.order_no  }
  end
end
