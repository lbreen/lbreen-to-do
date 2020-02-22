class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: "incomplete", user: user)
    end
  end

  def create?
    return true if user
  end

  def update?
    record.user == user
  end

  def complete?
    record.user == user
  end
end
