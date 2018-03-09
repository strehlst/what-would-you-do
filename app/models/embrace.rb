# frozen_string_literal: true

class Embrace < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  scope :with_testimonial, -> { where('LENGTH(testimonial) > 4') }
end
