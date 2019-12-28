require 'net/http'

class Course < ApplicationRecord
  belongs_to :subject

  has_one_attached :video
  enum course_type: %i[sample_video formal_video]

  before_save :set_video_length

  def set_video_length
    uri = URI("https://static.youleshu.vip/#{self.video.key}?avinfo")
    self.length = JSON.parse(Net::HTTP.get(uri))['streams'][0]['duration']
  end

  def display_length
    Time.at(self.length).utc.strftime("%H:%M:%S")
  end
end
