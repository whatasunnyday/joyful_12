class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :web_crawler_info

protected

  def ensure_onboarding
    redirect_to edit_user_path(current_user) and return unless current_user.onboarded?
  end

  def web_crawler_info
    if request.user_agent =~ /facebookexternalhit/
      render 'web_crawler/show', layout: false
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || model_specific_path(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end

  def model_specific_path(resource_or_scope)
    edit_user_path(resource_or_scope) if resource_or_scope.class == User
  end

end
