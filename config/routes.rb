Rails.application.routes.draw do

    devise_for :staffs, controllers: {
        sessions: 'staffs/sessions'
    }

end
