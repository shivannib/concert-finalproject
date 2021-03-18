task({ :send_reminders => :environment }) do

  # Retrieve your credentials from secure storage
  twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
  twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
  twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")

  # Create an instance of the Twilio Client and authenticate with your API key
  twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
  

  cutoff_time = 1.hour.from_now
  within_window = Concert.where("ticket_time < ?", cutoff_time)

  within_window.each do |a_concert|
    
    bookmarked_interests = a_concert.interests
    need_reminders = bookmarked_interests.where({ :alert_sent => false })

    need_reminders.each do |a_interest|
  
        # Craft your SMS as a Hash with three keys
        sms_parameters = {
          :from => twilio_sending_number,
          :to => @current_user.phone_number, 
          :body => "Ticket sales start in an hour - get ready!" #how do I make this specific to the concert?
        }

        # Send your SMS!
        twilio_client.api.account.messages.create(sms_parameters)
      
      a_interest.user.phone_number

      a_interest.alert_sent = true
      a_interest.save
    end
  end

end