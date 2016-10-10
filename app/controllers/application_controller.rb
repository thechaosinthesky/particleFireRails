class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout "basic"

  def verify_pin
  	authorize!(:manage, :all) if (current_user.pin != params[:pin])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || control_panel_path
  end
end
