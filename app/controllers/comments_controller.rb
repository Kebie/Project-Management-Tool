class CommentsController < ApplicationController
  
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def create
    @discussion = Discussion.find params[:discussion_id]
    @comment = @discussion.comments.new(comment_attributes)
    if @comment.save
      redirect_to [@discussion.project, @discussion], notice: "Comment added"
    else
      @comments = @discussion.comments
      render "/discussions/show"
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_attributes)
      redirect_to [@discussion.project, @discussion], notice: "Project succesfully updated"
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      redirect_to [@discussion.project, @discussion], notice: "Comment destroyed"
    else
      redirect_to [@discussion.project, @discussion], error: "There was a problem deleting your comment"
    end
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id] || params[:id])
    @discussion = @comment.discussion
  end
  
  def comment_attributes
    params.require(:comment).permit(:body)
  end


end
