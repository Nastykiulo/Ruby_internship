class RemoveAnswerFromQuesrions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :answer
    remove_column :questions, :test_id
  end
end
