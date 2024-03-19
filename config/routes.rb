Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  devise_for :users, path: "api/v1/users", path_names: {
                       registration: "sign_up",
                     },
                     controllers: {
                       registrations: "api/v1/users/registrations",
                       sessions: "api/v1/users/sessions",
                     }

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        get '/user_details' => 'current_user#index'
      end
      resources :documents, only: [:create]
      get '/documents' => 'documents#get_documents'
    end
  end

end
