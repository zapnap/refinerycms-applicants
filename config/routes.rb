Refinery::Application.routes.draw do
  get '/apply', :to => 'applicants#new', :as => 'new_applicant'
  get '/apply/thank-you', :to => 'applicants#thank_you'
  resources :applicants, :only => :create do
    collection do
      get :thank_you
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :questions do
      collection do
        post :update_positions
      end
    end
    resources :applicants do
      collection do
        post :update_positions
      end
    end
  end
end
