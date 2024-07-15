class Repositories::CommitsController < ApplicationController
  before_action :set_repository

  def show
    commit = Octokit.commit(@repository, params[:oid])
    render json: commit
  end

  def diff
    commit = Octokit.commit(@repository, params[:oid])
    parent_oid = commit[:parents].first[:sha]
    diff = Octokit.compare(@repository, parent_oid, params[:oid])
    render json: diff
  end

  def index
    commits = Octokit.commits(@repository, per_page: params[:per_page] || 30, page: params[:page] || 1)
    render json: commits
  end

  def compare
    comparison = Octokit.compare(@repository, params[:base], params[:head])
    render json: comparison
  end

  private

  def set_repository
    @repository = "#{params[:owner]}/#{params[:repository]}"
  end
end
