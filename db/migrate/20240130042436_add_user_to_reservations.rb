class AddUserToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :room, null: false, foreign_key: true
    add_column :reservations, :sum_price, :integer
  end
end
