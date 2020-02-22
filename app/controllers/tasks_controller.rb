class TasksController < ApplicationController
  def index
    user_categories = current_user.categories

    @tasks_with_categories = {}

    user_categories.each do |cat|
      @tasks_with_categories[cat] = cat.tasks
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  private

  def task_params
    params[:task].permit(:title, :description, :category_id)
  end
end
