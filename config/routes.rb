Rails.application.routes.draw do
  get 'students/index'
  resources :courses
  root 'pages#index'
  devise_for :students
  get 'students', to: 'students#index'
  post 'enroll_course', to: 'student_courses#create'
  delete 'delete_enrollment', to: 'student_courses#destroy'
  get 'enrollments', to: 'enrollments#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
