require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def sms
    from = params[:From]
    from = from.tr!('+','')

    message = params[:Body]
    message = message.split('#', 2)

    puts message[0]
    puts message[1]

    @guest = Guest.find_by(:phone => from)
    @event = Event.find(message[1])

    if message[0] == "YES" and @guest and @event
      @invite = Invitation.where(:event_id => @event.id, :guest_id => @guest.id)
      @invite.RSVP = true
      @invite.attending = true
      @invite.save
    elsif message[0] == "NO" and @guest and @event
      @invite = Invitation.find_by(:event_id => @event.id, :guest_id => @guest.id)
      # puts invite
      @invite.RSVP = true
      @invite.attending = false
      @invite.save
    end

  	response = Twilio::TwiML::Response.new do |r|
  	  r.Message 'Thanks for RSVPing!'
  	end

  	render_twiml response
  end
end
