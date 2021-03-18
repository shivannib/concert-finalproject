task({ :send_reminders => :environment }) do
  
  cutoff_time = 1.hour.from_now
  within_window = Interest.where("ticket_time < ?", cutoff_time)

  need_reminders = within_window.where({ :alert_sent => false })

  # Retrieve your credentials from secure storage
  twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
  twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
  twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")

  # Create an instance of the Twilio Client and authenticate with your API key
  twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

  need_reminders.each do |a_concert|
    #THIS IS WHERE IM PUTTING THE CODE FOR THE PHONE NUMBER STUFF

      # Craft your SMS as a Hash with three keys
      sms_parameters = {
        :from => twilio_sending_number,
        :to => "+14088395334", #would @current_user.phone_number work here? should i add a to_i
        :body => "It's going to rain today — take an umbrella!"
      }

      # Send your SMS!
      twilio_client.api.account.messages.create(sms_parameters)
    
    a_concert.user.phone_number

    a_concert.alert_sent = true
    a_concert.save
  end

end