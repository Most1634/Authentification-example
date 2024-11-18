class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #
  before_action :set_render_cart
  before_action :initialize_cart
  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    if session[:cart_id].present?
      @cart = Cart.find_by(id: session[:cart_id])
    end

    # If no cart was found, create a new cart and store its ID in the session
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id  # Save the new cart's ID in the session
    end
  end





  private
   def authenticate_user!
    redirect_to root_path, alert: "you must be logged in to do that " unless user_signed_in?
   end



  def current_user
    Current.user ||= authenticate_user_session
  end
  helper_method :current_user


  def authenticate_user_session
    User.find_by(id: session[:user_id])
  end
  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?




  def login(user)
  Current.user = user
  reset_session
  session[:user_id] = user.id
  end

  def logout(user)
    Current.user = nil
    reset_session
  end
end
