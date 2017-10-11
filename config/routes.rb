Rails.application.routes.draw do

resources :cards do
  member do
    get :choose_design
    post :update_design

    get :get_photo
    post :update_photo

    get :processing
  end
end

  get 'welcome/index'

  root 'welcome#index'

mount Shrine::DownloadEndpoint => "/attachments"
end
