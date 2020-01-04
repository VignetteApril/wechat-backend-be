class StaticImage < ApplicationRecord
  enum img_type: %i[main_page_video courses_page_banner user_agreement privacy_policy]
  # enum img_type: %i[main_page_video courses_page_banner user_agreement privacy_policy]
  has_one_attached :img
end
