class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.references :user_id
      t.references :room_id

      t.timestamps
    end
  end
end
