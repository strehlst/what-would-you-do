# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :survey
  belongs_to :user

end
