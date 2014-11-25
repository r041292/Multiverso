class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    if user_signed_in?
      if current_user.blocked
        sign_out current_user
        banned_user_path
      else
        root_path
      end
    end
	end
end
