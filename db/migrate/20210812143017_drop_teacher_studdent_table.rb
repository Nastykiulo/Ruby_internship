class DropTeacherStuddentTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :students_teachers
  end
end
