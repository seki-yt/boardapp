class CommentsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end

  def create
    @task = Task.find(params[:task_id])
    @comments = @task.comments.build(comment_params)
    if @comments.save!
      redirect_to board_task_path(board_id: @task.board_id, id: @task.id)
    else
      render :new
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end