class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :complete]

  def index
    user_categories = current_user.categories

    @tasks_with_categories = {}

    user_categories.each do |cat|
      @tasks_with_categories[cat] = cat.tasks.where(status: "incomplete")
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def complete
    if @task.complete!
      redirect_to tasks_path
    else
      redirect_to tasks_path
      flash[:alert] = "Unable to mark as complete!"
    end
  end

  private

  def task_params
    params[:task].permit(:title, :description, :category_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
