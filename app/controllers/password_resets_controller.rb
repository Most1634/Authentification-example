class PasswordResetsController < ApplicationController
  before_action :set_user_by_token, only: [ :edit, :update ]
def new
end

def create
    if (user = User.find_by(email: params[:email]))
            PasswordMailer.with(
              user: user,
              token: user.generate_token_for(:password_reset)
            ).password_reset.deliver_later
    end

    redirect_to root_path, notice: "check your email for the token "
end

def edit
end

def update
  if @user.update(password_params)
    redirect_to new_session_path, notice: "your password has been reseted"
  else
    render :edit, Status: :unprocessable_entity
  end
end

private
def set_user_by_token
    @user = User.find_by_token_for(:password_reset, params[:tokem])
    redirect_to new_password_reset_path, alert: "please try again" unless @user.present?
end
end
