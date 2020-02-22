class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :complete]
  before_action :authorize_task, only: [:new, :create, :edit, :update, :complete]

  def index
    tasks = policy_scope(Task)

    @tasks_with_categories = {}

    tasks.each do |task|
      category = task.category

      if @tasks_with_categories[category].nil?
        @tasks_with_categories[category] = []
      end

      @tasks_with_categories[category] << task
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
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
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js
      end
      flash[:alert] = "Unable to mark as complete!"
    end
  end

  private

  def task_params
    params[:task].permit(:title, :description, :category_id, :category)
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def authorize_task
    authorize @task
  end
end
