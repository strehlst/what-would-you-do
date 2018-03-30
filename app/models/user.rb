# frozen_string_literal: true

class User < ApplicationRecord
  include UploadHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :embraces

  attr_accessor :avatar_image_file, :delete_avatar_path

  def avatar_url
    image_path = self[:avatar_path] || 'default_avatar'
    ENV['IMAGE_CDN_PATH'] + '/avatars/' + image_path
  end

  def update_avatar
    if valid_image(avatar_image_file)
      image_id = upload_user_avatar_file(self, avatar_image_file)
      if image_id
        self.avatar_path = image_id
      else
        errors[:avatar_image_file] << 'upload'
      end
    else
      errors[:avatar_image_file] << 'invalid'
    end
  end
end
