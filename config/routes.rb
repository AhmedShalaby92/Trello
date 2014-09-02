Rails.application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tasks

  resources :user_stories do
    resources :user_story_files
  end 

  get 'projects/index'

  get 'projects/user_stories/show/:id' =>'user_stories#show'
  get 'projects/user_stories/new/:project_id' =>'user_stories#new'
  get 'productsjects/user_stories/show/tasks/:user_story_id' => 'tasks#new'
  get '/user_stories/tasks/:user_story_id' => 'tasks#new'

  patch '/user_stories/change_state/:id' => 'user_stories#changestate', as: "changestate" 

  devise_for :users, :controllers => { registrations: 'registrations' }
  #devise_for :admins
  resources :project_users
  resources :users
  resources :projects 
  root 'projects#index' , as: 'login'

  post 'projects/add_members' =>'projects#add_members'

  post 'user_stories/add_comment' =>'user_stories#add_comment' , as: 'add_comment'

  post 'project/comment' => 'projects#comment' , as: 'comments'

  get 'project/show_comments' => 'projects#show_comment' , as: 'show_comments'
  get 'project/deliver' => 'projects#deliver' , as: 'deliver'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
