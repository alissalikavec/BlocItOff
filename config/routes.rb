BlocItOff::Application.routes.draw do
  devise_for :users
  resources :todo

  get 'about' => 'welcome#about'

root to: 'welcome#index'
end
