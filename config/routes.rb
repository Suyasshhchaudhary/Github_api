Rails.application.routes.draw do
  namespace :repositories do
    get ':owner/:repository/commits/:oid', to: 'commits#show'
    get ':owner/:repository/commits/:oid/diff', to: 'commits#diff'
    get ':owner/:repository/commits', to: 'commits#index'
    get ':owner/:repository/compare/:base...:head', to: 'commits#compare'
    get ':owner/:repository', to: 'repositories#show'
  end
end
