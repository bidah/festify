class SessionController < ApplicationController
  helper_method def logged_in?
    !!current_user #double negation to convert to boolean
  end

  helper_method def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #memoized
  end

  def new
    redirect_to '/auth/spotify'
  end
  def create
    @user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid]) || User.create_from_omniauth(auth_hash)
    if @user
       session[:user_id] = @user.id
       redirect_to user_path(current_user)
    else
      redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  protected
  def auth_hash

    print request.env['omniauth.auth']
    request.env['omniauth.auth']
  end
end
