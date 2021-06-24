Rails.application.routes.draw do
  resources :gardens do
    # plants#create est nesté, car besoin d'un Garden pour créer une Plant
    resources :plants, only: [:create]    
  end

  # plants#destroy n'est pas nesté, car pas besoin d'autre chose que SON id
  resources :plants, only: [:destroy]
end
