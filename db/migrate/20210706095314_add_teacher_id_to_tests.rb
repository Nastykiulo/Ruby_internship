class AddTeacherIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :teacher_id, :integer
    add_index :tests, :teacher_id
  end
end
