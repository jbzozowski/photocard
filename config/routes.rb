Rails.application.routes.draw do

  resources :cards do
    member do
      get :choose_design
      post :update_design

      get :get_photo
      post :update_photo

      get :processing

      get :preview

      get :deliver

      patch :thanks

      get :pngify

    end
  end

  get 'pages/about'

  root 'welcome#index'

  mount Shrine.download_endpoint => "/attachments"
end
