class EventsController < ApplicationController

  def index
    user = User.find_by(id: session[:user_id])
    if user
      guest_status = Guest.find_by(id: user.guest_id)
      invitations = Invitation.where(guest_id: guest_status.id).pluck("event_id")
      @events = Event.where(id: invitations)
    else
      render 'layouts/login_splash'
    end
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
      guest = Guest.find_by(user_id: session[:user_id])
      @invitation = Invitation.new
      @invitation.guest_id = guest.id
      @invitation.event_id = @event.id
      @invitation.RSVP = true
      @invitation.attending = true

      if @invitation.save
        redirect_to events_url, notice: "Event added!"
      else
        render 'new'
      end

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

  def destroy
    event = Event.find_by(id: params[:id])
    if event
      event.delete
    end
    redirect_to event_url
  end

end
