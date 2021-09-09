class DeleteUnusrdFieldsForAnswer < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :question_id
    remove_column :answers, :student_id
  end
end
