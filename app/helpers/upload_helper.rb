# frozen_string_literal: true

module UploadHelper
  def upload_user_avatar_file(user, image_file)
    image_id = create_public_image_id(user.id)
    image_id if Cloudinary::Uploader.upload(
      image_file,
      public_id: ENV['IMAGE_CDN_PATH'] + '/avatars/' + image_id
    )
  end

  def delete_user_avatar_file(avatar_path)
    Cloudinary::Uploader.destroy(ENV['IMAGE_CDN_PATH'] + '/avatars/' + avatar_path)
  end

  private

  def create_public_image_id(user_id)
    "#{user_id}_#{random_str}"
  end

  def random_str
    ('a'..'z').to_a.sample(8).join
  end

  def valid_image(file)
    file && valid_mime_type(file.content_type)
  end

  def valid_mime_type(mime_type)
    %w[image/jpeg image/png].include? mime_type
  end
end
