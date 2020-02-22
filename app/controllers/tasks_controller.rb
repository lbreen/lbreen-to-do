class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :complete]

  def index
    tasks = policy_scope(Task)
    binding.pry
    # user_categories = current_user.categories

    tasks_with_categories = {}

    tasks.each do |task|
      category = task.category
    end

    # user_categories.each do |cat|
    #   incomplete_tasks = cat.tasks.where(status: "incomplete")

    #   unless incomplete_tasks.empty?
    #     @tasks_with_categories[cat] = cat.tasks.where(status: "incomplete")
    #   end
    # end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize @task
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
    params[:task].permit(:title, :description, :category_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
