class AdminController < ApplicationController
  def index
    console
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


end
