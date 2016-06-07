every 10.minutes do

  require 'twilio-ruby'
  @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
  @client.account.messages.list.each do |message|
    puts message.body
    if message.body.include? "YES#"
      @phone = message.from
      slice_index = message.body.index("#") + 1
      @event = message.body.slice(slice_index..-1).to_i
      put @phone
      put @event

    elsif message.body.include? "NO#"
      @phone = message.from
      slice_index = message.body.index("#") + 1
      @event = message.body.slice(slice_index..-1).to_i
      put @phone
      put @event

  end

end
