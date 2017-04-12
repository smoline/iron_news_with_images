class CommentsController < ApplicationController
  before_action :authorize!

  def edit
    @story = Story.find(params[:story_id])
    @comment = @story.comments.find(params[:id])

    unless @comment.created_by == current_user
      redirect_to stories_path, notice: "You are not authorized to perform that operation."
      return
    end
  end

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(comment_params)
    @comment.created_by = current_user

    if @comment.save
      redirect_to story_path(@story), notice: 'Comment was successfully created.'
    else
      redirect_to story_path(@story), notice: 'Comment was not saved.'
    end
  end

  def update
    @story = Story.find(params[:story_id])
    @comment = @story.comments.update(comment_params)

    unless @comment.created_by == current_user
      redirect_to story_path, notice: "You are not authorized to perform that operation."
      return
    end

    if @comment.valid? && @comment.update(comment_params)
      redirect_to @story, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:story_id])
    @comment = @story.comments.find(params[:id])

    unless @comment.created_by == current_user
      redirect_to stories_path, notice: "You are not authorized to perform that operation."
      return
    end

    @comment.destroy
    redirect_to story_path(@story), notice: 'Item was successfully destroyed'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
