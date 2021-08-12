class DeleteUnusrdFieldsForItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :question_id
  end
end
