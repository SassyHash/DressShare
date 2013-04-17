class AddSchoolName < ActiveRecord::Migration
  def change
    remove_column :schools, :school_name
    add_column :schools, :name, :string
  end
end
