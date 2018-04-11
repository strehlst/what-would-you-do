# frozen_string_literal: true

module ApplicationHelper
  def page_title
    page_title = ''
    # If instance variable from controller action sets a title, use it
    page_title = @page_title + ' | ' if @page_title
    page_title + t('main.unconditional_basic_income')
  end
end
