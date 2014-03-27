class ProjectsController < ApplicationController
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
    @project = Project.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def project_attributes
    params.require(:project).permit([:title,:description,:due_date])
  end

end
