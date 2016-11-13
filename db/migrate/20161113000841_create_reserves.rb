class CreateReserves < ActiveRecord::Migration[5.0]
  def change
    create_table :reserves do |t|
      t.string :email
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
