class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :dress_id
      t.date :start_date
      t.date :end_date


      t.timestamps
    end
  end
end
