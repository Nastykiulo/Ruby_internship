class AddAnswerItemToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :answer_item, foreign_key: true
  end
end
