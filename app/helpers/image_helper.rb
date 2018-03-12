# frozen_string_literal: true

module ImageHelper
  def quadratic_image_path(image_key, size = nil)
      cloudinary_image(image_key, size)
    end

private

  def cloudinary_image(image_key, size = nil)
    if size.nil?
      cl_image_path(image_key)
    else
      cl_image_path(image_key, gravity: 'face', crop: 'fill', height: size, width: size)
    end
  end
end
