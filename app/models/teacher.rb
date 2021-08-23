require 'search_object/plugin/graphql'

class Teacher < User
  include SearchObject.module(:sorting, :graphql)
    scope { Teacher.all }
    sort_by :last_name
    option(:id)             { |scope, value| scope.where id: value }
    option(:last_name)      { |scope, value| scope.where last_name: value }
    option(:created_at)     { |scope, dates| scope.created_after dates }
    
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
  branches << scope
    private
    def default_role
      self.role ||= :teacher
    end
end
