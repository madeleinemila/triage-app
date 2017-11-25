# == Route Map
#
#     Prefix Verb   URI Pattern                Controller#Action
#     issues GET    /issues(.:format)          issues#index
#            POST   /issues(.:format)          issues#create
#  new_issue GET    /issues/new(.:format)      issues#new
# edit_issue GET    /issues/:id/edit(.:format) issues#edit
#      issue GET    /issues/:id(.:format)      issues#show
#            PATCH  /issues/:id(.:format)      issues#update
#            PUT    /issues/:id(.:format)      issues#update
#            DELETE /issues/:id(.:format)      issues#destroy
#

Rails.application.routes.draw do
  root :to => "pages#home"
  # resources :users, :only => [:new]
  resources :issues
  resources :fixes
end
