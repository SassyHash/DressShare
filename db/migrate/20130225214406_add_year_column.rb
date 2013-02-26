class AddYearColumn < ActiveRecord::Migration
  def change
    add_column :users, :class_year, :integer
    remove_column :users, :session_token
    remove_column :users, :password_digest
  end
end
