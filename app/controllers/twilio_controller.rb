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
    message = message.split('#', 3)

    puts message[0]
    puts message[1]
    puts message[2]

    @guest = Guest.find_by(id: => message[2].to_i)
    @event = Event.find_by(:id => message[1].to_i)

    if message[0] == "YES" and @guest and @event
      @invite = Invitation.find_by(:event_id => @event.id, :guest_id => @guest.id)
      if @invite
        @invite.each do |i|
          i.RSVP = true
          i.attending = true
          i.save
        end
      end
    elsif message[0] == "NO" and @guest and @event
      @invite = Invitation.find_by(:event_id => @event.id, :guest_id => @guest.id)
      if @invite
        @invite.each do |i|
          i.RSVP = true
          i.attending = false
          i.save
        end
      end
    end

  	response = Twilio::TwiML::Response.new do |r|
  	  r.Message 'Thanks for RSVPing!'
  	end

  	render_twiml response
  end
end
