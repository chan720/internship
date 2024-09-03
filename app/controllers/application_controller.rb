class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    # You can customize the redirect path here
    stored_location_for(resource) || root_path  # Redirects to root_path if no stored location
  end
end
