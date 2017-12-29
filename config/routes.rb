Rails.application.routes.draw do

  devise_for :staffs, controllers: {
      sessions: 'staffs/sessions'
  }

  resource :tickets do
    get :index
    member do
      get :show
    end
  end
  resource :clients do
    get :tickets
  end

  root to: 'clients#new'
end
