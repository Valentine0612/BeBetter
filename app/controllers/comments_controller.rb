class CommentsController < ApplicationController
  
  def create
    modify_comment_params = comment_params
    modify_comment_params[:user_id] = current_user.id
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(modify_comment_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    redirect_to task_path(@task)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
