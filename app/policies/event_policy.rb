class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    has_privileges?
  end

  def create?
    return false unless user
    user.admin? || user.editor?
  end

  def destroy?
    return false unless user
    user.admin? || user.editor?
  end

  def has_privileges?
    return false unless user
    (user == record.user) || user.admin? || user.editor?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
