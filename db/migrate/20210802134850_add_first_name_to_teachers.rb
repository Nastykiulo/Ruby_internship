class AddFirstNameToTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :first_name
    add_column :teachers, :first_name, :string
  end
end
