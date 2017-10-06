Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :organizations do
    resources :organizations, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :organizations, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :organizations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :organizations do
    resources :addresses, :only => [:index, :show]
  end

  # Admin routes
  namespace :organizations, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/organizations" do
      resources :addresses, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :organizations do
    resources :addresses, :only => [:index, :show]
  end

  # Admin routes
  namespace :organizations, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/organizations" do
      resources :addresses, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
