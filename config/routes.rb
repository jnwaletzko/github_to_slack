GithubToSlack::Engine.routes.draw do
  resources :repositories
  resources :slackers
  resources :communicators
end
