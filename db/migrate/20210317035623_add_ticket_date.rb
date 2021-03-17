class AddTicketDate < ActiveRecord::Migration[6.0]
  def change
      add_column :concerts, :ticket_time, :datetime
  end
end
