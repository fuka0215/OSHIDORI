class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.references :user_id
      t.references :room_id
      t.string :message

      t.timestamps
    end
  end
end
