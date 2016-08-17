# encoding: utf-8

class JfNoticeImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploaded/"
    # 왜인지는 모르겠으나, ... 안되네
    # 젠장! 서버 on/off 였어
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end


  # 얘가 사이즈 업로드 지정 시켜주는 친구
  # 근데 어떻게 하는건지 아직 잘 모르겠다. 검색해보자.

  # Process files as they are uploaded:
  
  
   # def scale(width, height)
   #   process :scale => [200, 300]
   # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [50, 50]
  end
  
  # 사이즈 조정

  version :resized do
    # returns an image with a maximum width of 100px 
    # while maintaining the aspect ratio
    # 10000 is used to tell CW that the height is free 
    # and so that it will hit the 100 px width first
    process :resize_to_fit => [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    [*('a'..'z')].sample(20).join + "." + file.extension if original_filename
    # 혹은 Time.now.to_i 로 해주면 지금 시간을 integer로 바꿔줌니다.
    # Time.now.to_i.to_s(숫자를 문자로) + [*('a'..'z')].sample(20).join + "." + file.extension 으로 해봐~
  end

end
