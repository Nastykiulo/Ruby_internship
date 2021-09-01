# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create(email: 'admin@gmail.com', password: 'admin', password_confirmation: 'admin', role: :admin)
User.create(email: 'guest@gmail.com', password: 'guest', password_confirmation: 'guest', role: :guest)
#User.create(email: 'teacher@gmail.com', password: 'teacher', password_confirmation: 'teacher', role: 1)
#User.create(email: 'student@gmail.com', password: 'student', password_confirmation: 'student', role: 2)


Admin.create(email: 'admin1@gmail.com', password: 'admin1', password_confirmation: 'admin1', role: :admin)
Admin.create(email: 'admin2@gmail.com', password: 'admin2', password_confirmation: 'admin2', role: :admin)
Teacher.create(email: 'teacher1@gmail.com', password: 'teacher1', password_confirmation: 'teacher1', role: :teacher)
Teacher.create(email: 'teacher2@gmail.com', password: 'teacher2', password_confirmation: 'teacher2', role: :teacher)
Student.create(email: 'student1@gmail.com', password: 'student1', password_confirmation: 'student1', role: :student)
Student.create(email: 'student2@gmail.com', password: 'student2', password_confirmation: 'student2', role: :student)

Test.create(title: 'Test1', status: :published, due_date: DateTime.new(2012,1,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test2', status: :published, due_date: DateTime.new(2009,3,16), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test3', status: :published, due_date: DateTime.new(2005,7,10), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test4', status: :published, due_date: DateTime.new(2021,12,23), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test5', status: :published, due_date: DateTime.new(2009,11,10), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test6', status: :published, due_date: DateTime.new(2000,3,3), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test7', status: :published, due_date: DateTime.new(2001,9,27), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test8', status: :published, due_date: DateTime.new(2014,6,7), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test9', status: :published, due_date: DateTime.new(2008,1,1), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test10', status: :published, due_date: DateTime.new(2029,10,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test11', status: :published, due_date: DateTime.new(2009,1,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test12', status: :published, due_date: DateTime.new(2006,3,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test13', status: :published, due_date: DateTime.new(2002,6,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test14', status: :published, due_date: DateTime.new(2000,9,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test15', status: :published, due_date: DateTime.new(2021,12,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test16', status: :published, due_date: DateTime.new(2022,9,17), description: 'desctiption', teacher_id: 3, category: 'art')
Test.create(title: 'Test17', status: :published, due_date: DateTime.new(2000,1,17), description: 'desctiption', teacher_id: 3, category: 'art')

Answer.create(answer: 'answer1')
Answer.create(answer: 'answer2')
Answer.create(answer: 'answer3')
Answer.create(answer: 'answer4')
Answer.create(answer: 'answer5')
Answer.create(answer: 'answer6')
Answer.create(answer: 'answer7')
Answer.create(answer: 'answer8')



Assignment.create(test_id: 1, student_id: 4)
Assignment.create(test_id: 1, student_id: 4)
Assignment.create(test_id: 1, student_id: 4)
Assignment.create(test_id: 1, student_id: 4)
Assignment.create(test_id: 1, student_id: 4)
Assignment.create(test_id: 1, student_id: 4)
Assignment.create(test_id: 1, student_id: 4)
Assignment.create(test_id: 1, student_id: 4)