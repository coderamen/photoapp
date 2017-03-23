class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = 'You have successfully logged in'
        redirect_to user_path(user)
    else
        flash.now[:danger] = 'There is something wrong with your login information'
        render 'new'
    end
  end

  def create_from_omniauth
    auth_hash = request.env['omniauth.auth']
    authentication = Authentication.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid']) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
        user = authentication.user
        authentication.update_token(auth_hash)
        @next = root_url
        @notice = 'Signed in!'
    else
        user = User.create_with_auth_and_hash(authentication, auth_hash)
        @next = edit_user_path(user)
        @notice = 'User created - confirm or edit details'
    end
    sign_in(user)
    redirect_to @next, notice: @notice
  end

  def destroy
      session[:user_id] = nil
      flash[:success] = 'You have logged out'
      redirect_to root_path
  end
end
