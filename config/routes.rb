Rails.application.routes.draw do
  root 'sessions#new'

  get 'login', to: 'sessions#new', as: 'login'     
  post 'login', to: 'sessions#create'               
  delete 'logout', to: 'sessions#destroy', as: 'logout'  

  resources :patients
  resources :appointments

  get 'receptionist_dashboard', to: 'dashboard#receptionist', as: 'receptionist_dashboard'
  get 'doctor_dashboard', to: 'dashboard#doctor', as: 'doctor_dashboard'
end
