class RegistrationPolicy < ApplicationPolicy
  def index?
    return false unless user
    user.admin? || user.editor?
  end

  def create?
    !(record.event.user == user) || user.admin?
  end

  def approve?
    (record.event.user == user) || user.admin?
  end

  def ticket?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
