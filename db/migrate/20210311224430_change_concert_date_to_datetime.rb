class ChangeConcertDateToDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :concerts, :date, :datetime
  end
end
