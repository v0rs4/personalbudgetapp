Rails.application.routes.draw do
  use_doorkeeper

  default_url_options host: ENV['DOMAIN']

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :budget_domains do
        resources :categories, controller: :budget_categories, as: :budget_categories
        resources :expenses, controller: :budget_expenses, as: :budget_expenses
        resources :transactions, controller: :budget_transactions, as: :budget_transactions
      end
    end
  end

  scope '/budget' do
    get '/', to: redirect('/budget/domains')
    resources :domains, controller: :budget_domains, as: :budget_domains do
      resources :plans, controller: :budget_plans, as: :budget_plans
      resources :categories, controller: :budget_categories, as: :budget_categories
      resources :accounts, controller: :budget_accounts, as: :budget_accounts
      resources :incomes, controller: :budget_incomes, as: :budget_incomes
      resources :expenses, controller: :budget_expenses, as: :budget_expenses
      resources :debts, controller: :budget_debts, as: :budget_debts
      resources :invitations, controller: :budget_domain_invitations, as: :invitations, only: %i[new create]
      resources :members, controller: :budget_domain_memberships, as: :memberships do
        get 'join', on: :collection
      end
      get '/stats', to: 'statistics#index'
    end
    get '/stats', to: 'statistics#index'
  end

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
