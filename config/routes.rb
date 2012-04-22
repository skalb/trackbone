Trackbone::Application.routes.draw do
  root :to => "home#index"

  resources :projects do
    resources :features do
      resources :bugs
    end
  end
end