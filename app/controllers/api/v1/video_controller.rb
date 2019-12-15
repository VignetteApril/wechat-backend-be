class Api::V1::VideoController < Api::V1::BaseController
  # 视频播放action
  def play
    video_key  = params[:video_key]
    video_path = ActiveStorage::Blob.service.path_for(video_key)
    send_file video_path, type: "video/mp4", disposition: "inline", range: true
  end

  private
    def send_file(path, options = {})
      if options[:range]
        send_file_with_range(path, options)
      else
        super(path, options)
      end
    end

    def send_file_with_range(path, options = {})
      if File.exist?(path)
        size = File.size(path)
        if !request.headers["Range"]
          status_code = 200 # 200 OK
          offset = 0
          length = File.size(path)
        else
          status_code = 206 # 206 Partial Content
          bytes = Rack::Utils.byte_ranges(request.headers, size)[0]
          offset = bytes.begin
          length = bytes.end - bytes.begin
        end
        response.header["Accept-Ranges"] = "bytes"
        response.header["Content-Range"] = "bytes #{bytes.begin}-#{bytes.end}/#{size}" if bytes

        send_data IO.binread(path, length, offset), options
      else
        raise ActionController::MissingFile, "Cannot read file #{path}."
      end
    end
end
