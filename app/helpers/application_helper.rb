# frozen_string_literal: true

module ApplicationHelper
  def flash_class(type)
    mapping = {
      success: 'alert-success',
      notice: 'alert-info',
      alert: 'alert-danger',
      error: 'alert-danger',
      warn: 'alert-warning'
    }
    mapping[type.to_sym]
  end
end
