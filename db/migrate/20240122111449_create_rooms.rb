class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :information
      t.decimal :price
      t.string :address

      t.timestamps
    end

    add_column :rooms, :image, :string
  end
end
