class SessionsController < ApplicationController
  def destroy
      logout(current_user)
      redirect_to root_path, notice: "you have been loged out ."
  end


  def new
  end

  def create
      if user = User.authenticate_by(email: params[:email], password: params[:password])
              login user
              redirect_to root_path, noticce: "you have signed successfully. "
      else
        flash[:alert] = "invalid email or password ."
        render :new, status: :unprocessable_entity
      end
  end
end
