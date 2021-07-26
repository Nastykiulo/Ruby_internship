class AddTeacherToStudentTeachers < ActiveRecord::Migration[5.2]
  def change
    #add_reference :students_teachers, :teacher, foreign_key: true
    #add_reference :students_teachers, :student, foreign_key: true
    create_table(:students_teachers) do |t|
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
    end
    
  end
end
