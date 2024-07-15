module Repositories
  class RepositoriesController < ApplicationController
    def show
      owner = params[:owner]
      repository = params[:repository]
      repo = Octokit.repo("#{owner}/#{repository}")
      render json: repo
    end
  end
end
