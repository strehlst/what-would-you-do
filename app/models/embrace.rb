# frozen_string_literal: true

class Embrace < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  scope :with_testimonial, -> { where('LENGTH(testimonial) > 4') }

  def self.by_popularity_desc
    embrace_ids = []
    Embrace.group('dream_id')
      .order('dream_id desc')
      .count('embraces.id').each do |e|
      embrace_ids.push(e[1])
    end
    Embrace.find(embrace_ids)
  end
end
