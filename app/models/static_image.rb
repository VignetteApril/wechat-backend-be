class StaticImage < ApplicationRecord
  enum img_type: %i[main_page_banner main_page_video]

  has_one_attached :img
end
