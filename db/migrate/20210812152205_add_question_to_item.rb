class AddQuestionToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :question_title, :string
  end
end
