class RemoveAddlessFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :addless, :text
  end
end
