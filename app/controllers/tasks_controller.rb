class TasksController < ApplicationController
  before_action :find_task,
    only: [:show, :edit, :update, :destroy, :done]

  def index
    
  end

  def new
    @project = Project.find params[:project_id ]
    @task = Task.new
  end

  def edit
    
  end

  def update
    if @task.update_attributes tasks_attributes
      redirect_to [@project,@task], notice: "Project succesfully added"
    else 
      render :edit
    end
  end

  def show
  end

  def create
    @project = Project.find params[:project_id]
    @task = @project.tasks.new(tasks_attributes)
    if @task.save
      redirect_to @project, notice: "Task succesfully added"
    else
      render :new
    end    
  end

  def destroy
    if task.destroy
      redirect_to @project, notice: "Task deleted"
    else
      redirect_to project, error: "Task not deleted"
    end
  end

  def done
    @task.done ^= true
    @task.save
    redirect_to @project
  end

  private

  def tasks_attributes
    params.require(:task).permit(:title, :body, :done)
  end

  def find_task
    @task = Task.find(params[:task_id] || params[:id])
    @project = @task.project
  end

end
