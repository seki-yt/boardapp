class TasksController < ApplicationController

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save!
      redirect_to board_path(board)
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
     # =>  /boards/:board_id/tasks/:id(:format)
     # => idが2つ使えるようになる
  end

  def edit
    @task = Task.find(params[:id])
    @board = Board.find(params[:board_id])
  end

  def update
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])


    if @task.update(task_params)
      redirect_to board_task_path(@board.id, @task.id)
    else
      render new
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])

    @task.destroy!
    redirect_to board_path(@board)

  end


  private
  def task_params
    params.require(:task).permit(:title, :content, :eyecatch).merge(user_id: current_user.id )
  end
end