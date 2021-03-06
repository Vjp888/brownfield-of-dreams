# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :require_admin!

  def require_admin!
    four_oh_four if current_user.nil? || current_user.role == 'default'
  end
end
