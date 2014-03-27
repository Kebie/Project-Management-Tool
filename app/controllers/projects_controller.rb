class ProjectsController < ApplicationController
  before_action :find_project,
                  only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_attributes)
    if @project.save
      redirect_to projects_path, notice: "Project succesfully created."
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @project.update_attributes(project_attributes)
      redirect_to @project, notice: "Your project was updated!"
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project deleted"
    else
      redirect_to project_path, error: "We had a problem deleting this project"
    end
  end

  private
  def project_attributes
    params.require(:project).permit([:title,:description,:due_date])
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
