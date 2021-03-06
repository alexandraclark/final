class InvitationsController < ApplicationController

  def create
    @invite = Invitation.new
    @invite.guest_id = params[:invitation][:guest_id]
    @invite.event_id = params[:invitation][:event_id]
    @invite.RSVP = false
    @invite.attending = false

    if @invite.save
      @event = Event.find(params[:invitation][:event_id])
      redirect_to event_path(@event), notice: "Invite sent!"
    else
      render 'new'
    end
  end

end
