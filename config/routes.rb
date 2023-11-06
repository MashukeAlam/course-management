Rails.application.routes.draw do
  resources :student_subjects
  resources :teacher_subjects
  resources :semester_subjects
  resources :student_progresses
  resources :dept_students
  resources :subjects
  resources :semesters
  resources :years
  resources :departments
  resources :requests
  resources :homes
  resources :roles
  devise_for :users
  root to: 'homes#index'
  get 'requests/approve/:id', to: 'requests#approve'
  get 'semester_subjects/custom_create/:semester_id/:subject_id', to: 'semester_subjects#custom_create'
  get 'semester_subjects/custom_destroy/:semester_id/:subject_id', to: 'semester_subjects#custom_destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
