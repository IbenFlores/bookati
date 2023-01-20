class BookPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user.seller
  end

  def show?
    true
  end

  def update?
    record.seller == user.seller
  end

  def destroy?
    record.seller == user.seller
  end
end
