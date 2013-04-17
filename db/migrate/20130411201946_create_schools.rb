class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :town
      t.string :state
      t.string :domain

      t.timestamps
    end
  end
end
