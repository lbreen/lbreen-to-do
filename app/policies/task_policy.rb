class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: "incomplete")
    end
  end

  def create?
    true
  end

  def update?
    binding.pry
  end
end
