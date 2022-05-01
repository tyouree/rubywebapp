class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  include LoginHelper

  def render_401
    flash.now[:danger] = t('controllers.login.login_in')
    render "/login/new.html.erb" , status: 401
  end
end
