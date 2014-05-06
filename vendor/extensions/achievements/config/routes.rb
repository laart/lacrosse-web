Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :achievements do
    resources :achievements, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :achievements, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :achievements, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
