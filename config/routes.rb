Rails.application.routes.draw do  
  resources :albums
  resources :bands
  resources :items
  resources :answers
  resources :questions
  resources :tests
  resources :teachers
  
root 'home#index'
get 'home/about'
get 'home/actions'

devise_for :users, controllers: { registrations: "users/registrations" }
devise_for :admins, controllers: { registrations: "admins/registrations" }
devise_for :teachers, controllers: { registrations: "teachers/registrations"}
devise_for :students, controllers: { registrations: "students/registrations"}



# resources :bands do
#   resources :albums
# end
#has_and_belongs_to_many routes
#/tests/id/students
# resources :teachers do
#   resources :students
# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #/tests/id/questions
  # resources :tests  do
  #   resources :questions
  # end

  resources :teachers do
    resources :tests do
     resources :questions do 
      resources :answers
     end
    end
  end
  #/tests/id/students
  resources :tests  do
    resources :students
  end
  #/tests/id/tests
  resources :teachers  do
    resources :tests
  end

  resources :questions do
  resources :answers
end
  #get "tests#addstudent"
  match "/addstudent" => "tests#addstudent", :via => :get, :as => :addstudent

  match "/teacherstudent" => "teachers#students", :via => :get, :as => :students
  
#   resources :students do
#     get :teacher_id, to: "students#new" #-> yoururl.com/registrations/:course_id
#  end
end
