Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :patients do
    resources :appointments
  end
  resources :admins
  resources :doctors do
    resources :prescriptions
  end
  get 'home', to: 'patients#home' , as: 'home'
  get 'login', to: 'sessions#new' , as: 'login'
  post 'sessions/create'
  get 'sessions/destroy'
  get 'doctorlogin', to: 'doctors#new' , as: 'doctorlogin'
  get 'adminlogin', to: 'admins#new' , as: 'adminlogin'
  get 'registerdoctor' , to: 'doctors#register' , as: 'registerdoctor'
  get 'view/:id',to: 'patients#view' , as:'view'
  get 'adminviewall', to: 'prescriptions#adminviewall', as: 'adminviewall'
  get 'docviewall', to: 'prescriptions#docviewall', as: 'docviewall'
  get 'patviewall', to: 'prescriptions#patviewall', as: 'patviewall'
  get 'viewallappointments',to: 'appointments#view' , as:'viewallappointments'
  get 'viewpatients/:id',to: 'doctors#viewpatients' , as:'viewpatients'
  post 'doctorsessions/create'
  get 'doctorsessions/destroy'
  root 'patients#home'

end
