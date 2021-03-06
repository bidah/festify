class SessionsController < ApplicationController
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

    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    #@spotify_user.create_playlist!('my_awesome_playlist')
    #return render json: @spotify_user.saved_tracks()
    
    @user_artists = @spotify_user.saved_tracks.collect {|song| song.artists[0].name } 
    # session['user_artist'] = @user_artist.to_json
    session[:artists] = @user_artists

    if @user
       session[:user_id] = @user.id
       return redirect_to sessions_path
    else
      return redirect_to sessions_path
    end
  end

  def index
    #console
    @events = Event.all
    @user_artists = session[:artists]
    # puts JSON.parse()session['user_artist']@user_artists
    
    @events_artists = Event.all
    @events_to_go = []
    @events_artists.each do |event|
      @artists_from_events_that_match_user_fav_artists = @user_artists.select do |user_artist|
        if event.artists.split(',').map(&:lstrip).include? user_artist
          @events_to_go << event
        end
      end
    end

    render :template => 'test/index'
  end

  def destroy
    reset_session 
    redirect_to root_url
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
