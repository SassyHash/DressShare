class AddColumnsToSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :size_searches, :string
  	add_column :searches, :body_type_searches, :string

  end
end
