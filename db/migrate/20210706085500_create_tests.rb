class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :string
      t.string :status
      t.string :question_list
      t.date :due_date
      t.string :description

      t.timestamps
    end
  end
end
