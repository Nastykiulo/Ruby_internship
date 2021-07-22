class AddStudentIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :student_id, :integer
    add_index :answers, :student_id
  end
end
