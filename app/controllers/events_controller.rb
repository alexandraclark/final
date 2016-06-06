class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:event][:title]
    @event.date = params[:event][:date]
    @event.details = params[:event][:details]
    @event.image_url = params[:event][:image_url]
    @event.budget = params[:event][:budget]
    if @event.save
      redirect_to events_url, notice: "Event added!"
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event == nil
      redirect_to events_url
    end
  end

end
