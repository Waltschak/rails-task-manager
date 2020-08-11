class TasksController < ApplicationController
  before_action :all_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def create
    @task = Task.new(strong_task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update(strong_task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def strong_task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def all_tasks
    @task = Task.find(params[:id])
  end
end
