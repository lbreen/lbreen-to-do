class TasksController < ApplicationController
  def index
    user_categories = current_user.categories

    @tasks_with_categories = {}

    user_categories.each do |cat|
      @tasks_with_categories[cat] = cat.tasks
    end
  end
end
