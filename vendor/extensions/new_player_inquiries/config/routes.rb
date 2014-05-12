Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :new_player_inquiries do
    resources :new_player_inquiries, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :new_player_inquiries, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/new_player_inquiries" do
      resources :new_player_inquiries, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

