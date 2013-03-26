class ProjectsController < ApplicationController
  respond_to :json

  def index
    @projects = Project.all
  end

  def create
    project = Project.new(project_params)
    project.save
    respond_with(project)
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    respond_with(project)
  end

  def update
    project = Project.find(params[:id])
    project.update_attributes(project_params)
    respond_with(project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
