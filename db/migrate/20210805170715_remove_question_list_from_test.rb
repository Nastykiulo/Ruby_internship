class RemoveQuestionListFromTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :question_list
  end
end
