class StaticImage < ApplicationRecord
  enum img_type: %i[main_page_banner main_page_video courses_page_banner]

  has_one_attached :img
end
