class AdminController < ApplicationController
  def index
    @my_events = Event.where(admin_id: current_admin.id) 
  end

  def new
    @event = Event.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end
  def consulta
      @artists = RSpotify::Artist.search('System of down')
      render json: @artists

  end
  #def show
  #    @artists = RSpotify::Artist.search('System of down')
  #    render json: @artists

  #end


end
