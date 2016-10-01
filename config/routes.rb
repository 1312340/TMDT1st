Rails.application.routes.draw do

  get 'home/index'

  get 'index' => 'hello#index'
  root 'home#index'
end
