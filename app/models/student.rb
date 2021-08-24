class Student < User
    # attr_accessor :teacher, :teacher_id
    has_and_belongs_to_many :tests
    belongs_to :user
    enum role: [:student]

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def apply_filter(scope, value)
        # normalize filters from nested OR structure, to flat scope list
        branches = normalize_filters(value).reduce { |a, b| a.or(b) }
        scope.merge branches
    end
    private
        def default_role
            self.role ||= :student
        end
end
