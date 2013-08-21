OnePerFWeb::Application.routes.draw do
  get "mains/index"
  post "mains/parse"
  root :to => 'mains#index', :as => 'index'
end
