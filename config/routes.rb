Loco::Application.routes.draw do
  devise_for :users

  root to: "dashboard#index"

  resources :boards, except: [:new, :edit]
  resources :lists, except: [:new, :edit, :show]
end
