# frozen_string_literal: true

module ApplicationHelper
  def current_user?(model)
    current_user==model.user
  end
end
