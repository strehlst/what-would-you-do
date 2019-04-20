# frozen_string_literal: true

module ValidationsHelper
  def valid_length(attribute_name, character_sequence, min_length, max_length)
    if trim(character_sequence).length < min_length
      errors[attribute_name.to_sym] << I18n.t('errors.string_too_short')
    elsif trim(character_sequence).length > max_length
      errors[attribute_name.to_sym] << I18n.t('errors.string_too_long')
    end
  end

  def trim(character_sequence)
    character_sequence.sub(/\s+\Z/, '')
  end
end
