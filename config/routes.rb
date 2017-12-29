Rails.application.routes.draw do

  devise_for :staffs, controllers: {
      sessions: 'staffs/sessions'
  }

  resource :tickets do
    get :index
  end
  resource :clients do
    get :tickets
  end

  root to: 'clients#new'
end
