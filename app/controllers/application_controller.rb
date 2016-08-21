class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :verify_logged_in, :categories, :current_admin?
  before_action :set_cart

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def verify_logged_in
    unless current_user
      flash[:danger] = "Please login to view this page"
      redirect_to login_path
    end
  end

  def current_admin?
    current_user && !current_user.customer?
  end

  def categories
    @categories = Category.all
  end

  # def default_url_options
  #   if Rails.env.production?
  #     { host: 'nosebleed-tix.herokuapp.com'}
  #   else
  #     {}
  #   end
  # end
end
