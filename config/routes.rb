Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'languages' => 'languages#index'
  match 'search', to: 'languages#search', via: [:post]


  root 'languages#index'
end
