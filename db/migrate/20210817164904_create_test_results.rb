class CreateTestResults < ActiveRecord::Migration[5.2]
  def change
    create_table :test_results do |t|
      t.references :assignment, foreign_key: true
      t.boolean :pass

      t.timestamps
    end
  end
end
