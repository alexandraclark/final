class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    @event_id = params[:event_id]
    @event_date = Event.find_by(:id => params[:event_id]).date
    @event_title = params[:event_title]
    @phone = params[:phone]
    @full_name = params[:full_name]
    # @phone = '7157181178'
    # @full_name = 'whoever'

    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '7153182885', to: @phone.to_s, body: 'Hi, ' + @full_name +
                                                                                '! Remember to mark your calendar for ' + @event_title +
                                                                                ' on ' + @event_date +
                                                                                '! If you haven\'t already RSVP\'d, reply to this text message with YES#' + @event_id + ' or NO#' + @event_id + '. Hope to see you there!'
    flash[:notice] = "Nudged " + @full_name + "!"
    redirect_to :back
  end

end