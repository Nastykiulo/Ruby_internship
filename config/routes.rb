Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :admins
  #devise_for :users
  # devise_for :users, controllers: {
  #      :registrations => "users/registrations" }
  
  resources :answers
  resources :questions
  #resources :students
  #resources :teachers
  resources :tests
  #get 'home/index'
root 'home#index'
get 'home/about'
get 'home/actions'

devise_for :users, controllers: { registrations: "users/registrations" }
devise_for :admins, controllers: { registrations: "admins/registrations" }
devise_for :teachers, controllers: { registrations: "teachers/registrations"}
devise_for :students, controllers: { registrations: "students/registrations"}

#has_and_belongs_to_many routes
resources :teachers do
  resources :students
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #/tests/id/questions
  resources :tests  do
    resources :questions
  end
  #/tests/id/students
  # resources :teachers  do
  #   resources :students
  # end
  #/tests/id/tests
  # resources :teachers  do
  #   resources :tests
  # end

#   resources :students do
#     get :teacher_id, to: "students#new" #-> yoururl.com/registrations/:course_id
#  end
end
