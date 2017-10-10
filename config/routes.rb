Rails.application.routes.draw do

resources :cards do
  member do
    get :choose_design
    post :update_design

    get :get_photo
  end
end

  get 'welcome/index'

  root 'welcome#index'
end
