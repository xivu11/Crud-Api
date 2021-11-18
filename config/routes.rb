Rails.application.routes.draw do
  namespace :api do
    get 'typeahead/:input', to: 'users#typeahead', as: 'typeahead'
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#curl -X DELETE http://localhost:3000/api/users/6
#curl -X PUT http://localhost:3000/api/users/6 --header 'Content-Type: application/json' --data '{"firstName":"abc"}'
#curl -X POST http://localhost:3000/api/users --header 'Content-Type: application/json' --data '{"firstName":"fname","lastName":"lname","email":"em@email,in"}'
#curl -X GET http://localhost:3000/api/users/2
#curl -X GET http://localhost:3000/api/users
#curl -X GET http://localhost:3000/api/typeahead/iss
