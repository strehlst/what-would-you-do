# frozen_string_literal: true

class User < ApplicationRecord
  include UploadHelper
  include ValidationsHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :embraces

  validates :public_name, presence: true
  validate :valid_public_name_length

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
        errors[:avatar_image_file] << I18n.t('errors.upload_failed')
      end
    else
      errors[:avatar_image_file] << I18n.t('errors.invalid_mime_type')
    end
  end

  private

  def valid_public_name_length
    public_name = trim(public_name)
    valid_length('public_name', public_name, 2, 20)
  end
end
