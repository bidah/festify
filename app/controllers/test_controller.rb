class TestController < ApplicationController
    helper_method def logged_in?
    !!current_user #double negation to convert to boolean
  end

  helper_method def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #memoized
  end

  helper_method def get_event
      @event =Event.all
  end 
  def index
  end

  def about
  end

  def contact
  end
end
