class RemoveTestIdFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :test_id
  end
end
