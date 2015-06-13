class EventsController < ApplicationController

  def new
    console
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to admin_index_path
    else
      render :new
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :artists, :ticket_link, :admin_id)
  end
end
