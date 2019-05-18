class Admin::BaseController < ApplicationController
  before_action :require_admin!

  def require_admin!
    if current_user.nil? || current_user.role == 'default'
      four_oh_four
    end
  end
end
