class AlertSentDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :interests, :alert_sent, :boolean, :default => false
  end
end
