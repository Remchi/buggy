class ProjectsController < ApplicationController
  respond_to :json

  def index
    respond_with(Project.all)
  end
end
