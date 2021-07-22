class AddStudenIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :student_id, :integer
    add_index :tests, :student_id
  end
end
