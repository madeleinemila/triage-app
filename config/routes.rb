# == Route Map
#
#                Prefix Verb   URI Pattern                          Controller#Action
#                  root GET    /                                    pages#home
#                 users GET    /users(.:format)                     users#index
#                       POST   /users(.:format)                     users#create
#              new_user GET    /users/new(.:format)                 users#new
#             edit_user GET    /users/:id/edit(.:format)            users#edit
#                  user PATCH  /users/:id(.:format)                 users#update
#                       PUT    /users/:id(.:format)                 users#update
#                issues GET    /issues(.:format)                    issues#index
#                       POST   /issues(.:format)                    issues#create
#             new_issue GET    /issues/new(.:format)                issues#new
#            edit_issue GET    /issues/:id/edit(.:format)           issues#edit
#                 issue GET    /issues/:id(.:format)                issues#show
#                       PATCH  /issues/:id(.:format)                issues#update
#                       PUT    /issues/:id(.:format)                issues#update
#                       DELETE /issues/:id(.:format)                issues#destroy
#                       GET    /fixes/new/:id(.:format)             fixes#new
#                 fixes GET    /fixes(.:format)                     fixes#index
#                       POST   /fixes(.:format)                     fixes#create
#               new_fix GET    /fixes/new(.:format)                 fixes#new
#              edit_fix GET    /fixes/:id/edit(.:format)            fixes#edit
#                   fix GET    /fixes/:id(.:format)                 fixes#show
#                       PATCH  /fixes/:id(.:format)                 fixes#update
#                       PUT    /fixes/:id(.:format)                 fixes#update
#                       DELETE /fixes/:id(.:format)                 fixes#destroy
#          technologies GET    /technologies(.:format)              technologies#index
#                       POST   /technologies(.:format)              technologies#create
#        new_technology GET    /technologies/new(.:format)          technologies#new
#       edit_technology GET    /technologies/:id/edit(.:format)     technologies#edit
#            technology GET    /technologies/:id(.:format)          technologies#show
#                       PATCH  /technologies/:id(.:format)          technologies#update
#                       PUT    /technologies/:id(.:format)          technologies#update
#                       DELETE /technologies/:id(.:format)          technologies#destroy
#       favorite_issues POST   /favorite_issues(.:format)           favorite_issues#create
#        favorite_issue DELETE /favorite_issues/:id(.:format)       favorite_issues#destroy
#        favorite_fixes POST   /favorite_fixes(.:format)            favorite_fixes#create
#          favorite_fix DELETE /favorite_fixes/:id(.:format)        favorite_fixes#destroy
# favorite_technologies POST   /favorite_technologies(.:format)     favorite_technologies#create
#   favorite_technology DELETE /favorite_technologies/:id(.:format) favorite_technologies#destroy
#                 login GET    /login(.:format)                     session#new
#                       POST   /login(.:format)                     session#create
#                       DELETE /login(.:format)                     session#destroy
# 

Rails.application.routes.draw do
  root :to => "pages#home"
  resources :users, :only => [:index, :new, :create, :edit, :update]
  resources :issues
  get '/fixes/new/:id' => 'fixes#new'
  resources :fixes
  resources :technologies
  resources :favorite_issues, :only => [:create, :destroy]
  resources :favorite_fixes, :only => [:create, :destroy]
  resources :favorite_technologies, :only => [:create, :destroy]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
