class Teacher < User
    has_and_belongs_to_many :students
    #has_many :test
    #has_many :users, -> {where(role: student)}
    enum role: [:teacher]

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    private
    def default_role
      self.role ||= :teacher
    end
end
