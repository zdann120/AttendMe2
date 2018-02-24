class RegistrationPolicy < ApplicationPolicy
  def index?
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
