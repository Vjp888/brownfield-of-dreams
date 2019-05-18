class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :list_tags

  add_flash_types :success

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def four_oh_four
    render status: 404, file: "#{Rails.root}/public/404.html"
  end

  def admin?
    if current_user.role == 'admin'
      true
    elsif current_user.role == 'default'
      false
    end
  end
end
