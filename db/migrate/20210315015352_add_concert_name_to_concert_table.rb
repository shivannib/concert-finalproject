class AddConcertNameToConcertTable < ActiveRecord::Migration[6.0]
  def change
    add_column :concerts, :name, :text
  end
end
