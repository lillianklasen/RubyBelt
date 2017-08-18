Rails.application.routes.draw do
    get '' => 'users#new'
    post 'register' => 'users#create'
    get 'bright_ideas' => 'users#index'
    get 'users/:id' => 'users#show'

    post 'ideas' => 'ideas#create'
    delete 'ideas/:id' => 'ideas#destroy'
    get 'ideas/:id' => 'ideas#show'

    post 'ideas/like' => 'likes#create'

    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

end
