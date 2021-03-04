class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :home_city
      t.boolean :artist
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
