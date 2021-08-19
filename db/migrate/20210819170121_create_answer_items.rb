class CreateAnswerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_items do |t|
      t.string :title
      t.boolean :correct

      t.timestamps
    end
  end
end
