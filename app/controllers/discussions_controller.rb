class DiscussionsController < ApplicationController
  before_action :find_discussion,
          only: [:show, :edit, :update, :destroy]

  def index
    
  end

  def new
    @project = Project.find params[:project_id]
    @discussion = Discussion.new
  end

  def edit
    @project = @discussion.project
  end

  def update
    @project = Project.find params[:project_id] 
    if @discussion.update_attributes(discussion_attributes)
      redirect_to [@project,@discussion], notice: "Discussion successfully updated"
    else
      render :edit
    end
  end

  def show
    @project = @discussion.project
    @comments = @discussion.comments
    @comment = Comment.new
  end

  def create
    @project = Project.find params[:project_id] #first you have to get the project object to the create the discussion for
    @discussion = @project.discussions.new(discussion_attributes)
    if @discussion.save
      redirect_to @project, notice: "Discussion successfully started!"
    else
      render :new 
    end
  end

  def destroy
    project = @discussion.project
    if @discussion.destroy
      redirect_to project, notice: "Discussion and comments destroyed"
    else
      redirect_to project, error: "Discussion not deleted"
    end
  end

  private
  
  def discussion_attributes
    params.require(:discussion).permit(:title, :description)
  end

  def find_discussion
    @discussion = Discussion.find(params[:discussion_id] ||params[:id])
  end

end
