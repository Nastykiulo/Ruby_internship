class AddTestIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :test_id, :integer
    add_index :answers, :test_id
  end
end
