class RemoveUserIdFromChats < ActiveRecord::Migration[6.1]
  def change
    remove_reference :chats, :user_id, null: false, foreign_key: true
  end
end
