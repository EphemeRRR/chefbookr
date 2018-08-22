class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    cloudinary_transformation width: 256, height: 256, crop: :fill
  end

  version :medium do
    cloudinary_transformation width: 400, height: 300, crop: :fill
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
