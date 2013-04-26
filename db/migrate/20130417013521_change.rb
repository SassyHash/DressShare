class ChangeSchoolName < ActiveRecord::Migration
  def change
    drop_column :schools, :school_name
    add_column :schools, :name, :string
  end
end
