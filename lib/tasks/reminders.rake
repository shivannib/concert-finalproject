task({ :send_reminders => :environment }) do
  p Interest.count

  cutoff_time = 24.hours.from_now
  within_window = Interest.where ("ticket_time < ?", cutoff_time)

  need_reminders = within_window.where({ :alert_sent => false })

  need_reminders.each do |a_concert|
    #Send a message via Twilio (is this where we copy paste the gem code from the chapter?)
    a_concert.user.phone_number

    a_concert.alert_sent = true
    a_concert.save
  end

end