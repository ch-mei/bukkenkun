class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def index
    @tasks = current_user.tasks #カレントユーザーのtaskのみ表示
    @user = current_user
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params) #カレントユーザーに紐づくtask作成
    @task.save!
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "情報を更新しました"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_back(fallback_location: root_path)
  end

  private
  def task_params
    params.require(:task).permit(:task, :limit_date)
  end
end
