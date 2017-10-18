Rails.application.routes.draw do

    scope "(:locale)", locale: /#{I18n.available_locales.json("|")}/ do
        root 'posts#index', as: 'home'
        resources :posts do
            resources :comments
        end

        get 'about' => 'pages#about', as: 'about'
    end
    #Api
    namespace 'api' do
        namespace 'v1' do
            resources :posts
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
