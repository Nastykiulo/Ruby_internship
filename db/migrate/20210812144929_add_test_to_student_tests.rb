class AddTestToStudentTests < ActiveRecord::Migration[5.2]
  def change
    create_table(:students_tests) do |t|
      t.references :test, foreign_key: true
      t.references :student, foreign_key: true
    end
    
  end
end
