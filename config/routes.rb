Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    resources :movies
    resources :lists do
      resources :bookmarks, only: [:create, :destroy] # : Ce bloc crée des routes RESTful spécifiques pour les signets associés à une liste. En particulier, il permet de créer (create) un nouveau signet et de détruire (destroy) un signet existant dans le contexte de la liste à laquelle il appartient. Les autres routes, telles que l'affichage de tous les signets ou la modification d'un signet, ne sont pas incluses ici pour restreindre les opérations aux seules actions nécessaires.
    end

end
