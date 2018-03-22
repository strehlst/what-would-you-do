# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :embraces

  def avatar_url
    image_path = self[:avatar_path] || 'default_avatar'
    ENV['IMAGE_CDN_PATH'] + '/avatars/' + image_path
  end
end
