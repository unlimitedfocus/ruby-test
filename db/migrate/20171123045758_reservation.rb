class Reservation < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.date :date_start
      t.date :date_end

      t.timestamps null: false
    end
  end
end
