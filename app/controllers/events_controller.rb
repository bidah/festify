class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:name, :ticket_link, :admin_id)
  end
end
