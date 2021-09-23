class TasksController < ApplicationController

  def new
    @task = current_user.tasks
    @task = Task.new
  end

  def index
    @tasks = current_user.tasks
    @user = current_user
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.save!
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
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
