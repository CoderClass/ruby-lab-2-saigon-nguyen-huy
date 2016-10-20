class SessionsController < ApplicationController
  def create
   if @user = User.find_by(email: params[:email])
     if @user.authenticate(params[:password])
       flash['success'] = "login successful"
       session[:user_id] = @user.id
     else
       flash['errors'] = "login invalid"
       redirect_to new_session_path
     end
   else
     flash['errors'] = "User not found"
     redirect_to new_session_path
   end


  end

  private
  def session_params
    params.require(:session).permit(:email,:password)
  end
end
