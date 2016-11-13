class AddMessageToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :message, :text
  end
end
