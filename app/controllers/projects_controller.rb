class ProjectsController < ApplicationController
  respond_to :json

  def index
    respond_with(Project.all)
  end

  def create
    project = Project.new(project_params)
    project.save
    respond_with(project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
