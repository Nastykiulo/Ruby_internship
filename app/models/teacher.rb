class Teacher < User
    has_many :test
    #has_many :users, -> {where(role: student)}
    enum role: [:teacher]

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
   def apply_filter(scope, value)
    # normalize filters from nested OR structure, to flat scope list
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end
  
    private
    def default_role
      self.role ||= :teacher
    end
end
