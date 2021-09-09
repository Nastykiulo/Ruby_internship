class DeleteUnusrdFieldsForTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :string
    remove_column :tests, :student_id
    add_column :tests, :category, :string
  end
end
