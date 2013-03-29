class ProjectsController < ApplicationController
  respond_to :json

  before_filter :authenticated, only: [ :create ]

  def index
    @projects = Project.all
  end

  def create
    project = Project.new(project_params)
    project.save
    respond_with(project)
  end

  def show
    @project = Project.includes(:issues).find(params[:id])
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

  def authenticated
    if cannot? :create, Project
      render status: :forbidden, text: "Forbidden"
    end
  end
end
