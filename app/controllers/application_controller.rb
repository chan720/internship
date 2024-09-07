class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
  helper_method :current_cart

  def current_user
    super
  end

  def current_cart
    if user_signed_in?
      @current_cart ||= current_user.cart || current_user.create_cart
    else
      @current_cart = nil
    end
  end
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
end
