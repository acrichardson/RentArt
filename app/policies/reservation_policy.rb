class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new
    return true
  end

  def create?
    return true
  end

   def destroy?
    record.user == user || record.product.user == user
  end

  def show?
    true
  end

  def my_reservations?
    true
  end
end
