class AlertSent < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :alert_sent, :boolean
  end
end
