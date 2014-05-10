Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :managers do
    resources :managers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :managers, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :managers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
