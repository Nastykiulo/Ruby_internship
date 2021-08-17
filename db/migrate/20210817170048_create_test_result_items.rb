class CreateTestResultItems < ActiveRecord::Migration[5.2]
  def change
    create_table :test_result_items do |t|
      t.references :question, foreign_key: true
      t.integer :student_answer_id
      t.references :test_result, foreign_key: true

      t.timestamps
    end
  end
end
