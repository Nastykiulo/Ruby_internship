class Student < User
    # attr_accessor :teacher, :teacher_id
     has_and_belongs_to_many :teachers
    # #belongs_to :teacher
    # belongs_to :user
    # has_many :test
    # has_many :answer
    enum role: [:student]

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    private
        def default_role
            self.role ||= :student
        end
end
