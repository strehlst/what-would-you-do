# frozen_string_literal: true

module ValidationsHelper
  def valid_string_length(attribute_name, string, min_length, max_length)
    trimmed_string = string.sub(/\s+\Z/, '')
    if trimmed_string.length < min_length
      errors[attribute_name.to_sym] << I18n.t('errors.string_too_short')
    elsif trimmed_string.length > max_length
      errors[attribute_name.to_sym] << I18n.t('errors.string_too_long')
    end
  end
end
