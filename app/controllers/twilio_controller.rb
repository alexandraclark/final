require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def sms
    from = params[:From]
    from = from.tr!('+','')
    from = from[1..-1]

    message = params[:Body]
    message = message.split('#', 2)

    puts message[0]
    # puts message[1]

    @guest_ids = Guest.where(:phone => from.to_i).pluck(:id)
    @event = Event.find_by(:id => message[1].to_i)

    if message[0] == "YES" and @guest_ids and @event
      @invite = Invitation.where(:event_id => @event.id, :guest_id => @guest_ids).first
      if @invite
        @invite.RSVP = true
        @invite.attending = true
        @invite.save
      end
    elsif message[0] == "NO" and @guest_ids and @event
      @invite = Invitation.find_by(:event_id => @event.id, :guest_id => @guest.id).first
      if @invite
        @invite.RSVP = true
        @invite.attending = false
        @invite.save
      end
    end

  	response = Twilio::TwiML::Response.new do |r|
  	  r.Message 'Thanks for RSVPing!'
  	end

  	render_twiml response
  end
end
