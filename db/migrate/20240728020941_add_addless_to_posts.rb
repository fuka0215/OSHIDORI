class AddAddlessToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :addless, :text
  end
end
