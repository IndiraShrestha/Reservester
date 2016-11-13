class AddEmailToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :email, :string
    add_column :reservations, :date_time, :datetime
  end
end
