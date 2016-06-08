class EventsController < ApplicationController

  def index
    user = User.find_by(id: session[:user_id])
    if user
      guest_status = Guest.find_by(id: user.guest_id)
      if guest_status
        invitations = Invitation.where(guest_id: guest_status.id).pluck("event_id")
        @events = Event.where(id: invitations)
      else render 'layouts/no_events'
      end
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

    @list = List.new
    @list.title = @event.title

    if @event.save and @list.save
      guest = Guest.find_by(user_id: session[:user_id])
      @invitation = Invitation.new
      @invitation.guest_id = guest.id
      @invitation.event_id = @event.id
      @invitation.RSVP = true
      @invitation.attending = true

      @list.event_id = @event.id

      if @invitation.save and @list.save
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

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.title = params[:event][:title]
    @event.date = params[:event][:date]
    @event.budget = params[:event][:budget]
    @event.details = params[:event][:details]
    @event.image_url = params[:event][:image_url]

    if @event.save
      redirect_to event_url(@event.id)
    else
      render :edit
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
