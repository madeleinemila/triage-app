# == Route Map
#
#          Prefix Verb   URI Pattern                      Controller#Action
#       users_new GET    /users/new(.:format)             users#new
#            root GET    /                                pages#home
#        new_user GET    /users/new(.:format)             users#new
#          issues GET    /issues(.:format)                issues#index
#                 POST   /issues(.:format)                issues#create
#       new_issue GET    /issues/new(.:format)            issues#new
#      edit_issue GET    /issues/:id/edit(.:format)       issues#edit
#           issue GET    /issues/:id(.:format)            issues#show
#                 PATCH  /issues/:id(.:format)            issues#update
#                 PUT    /issues/:id(.:format)            issues#update
#                 DELETE /issues/:id(.:format)            issues#destroy
#           fixes GET    /fixes(.:format)                 fixes#index
#                 POST   /fixes(.:format)                 fixes#create
#         new_fix GET    /fixes/new(.:format)             fixes#new
#        edit_fix GET    /fixes/:id/edit(.:format)        fixes#edit
#             fix GET    /fixes/:id(.:format)             fixes#show
#                 PATCH  /fixes/:id(.:format)             fixes#update
#                 PUT    /fixes/:id(.:format)             fixes#update
#                 DELETE /fixes/:id(.:format)             fixes#destroy
#    technologies GET    /technologies(.:format)          technologies#index
#                 POST   /technologies(.:format)          technologies#create
#  new_technology GET    /technologies/new(.:format)      technologies#new
# edit_technology GET    /technologies/:id/edit(.:format) technologies#edit
#      technology GET    /technologies/:id(.:format)      technologies#show
#                 PATCH  /technologies/:id(.:format)      technologies#update
#                 PUT    /technologies/:id(.:format)      technologies#update
#                 DELETE /technologies/:id(.:format)      technologies#destroy
#

Rails.application.routes.draw do
  root :to => "pages#home"
  resources :users, :only => [:new, :create]
  resources :issues
  resources :fixes
  resources :technologies
end
