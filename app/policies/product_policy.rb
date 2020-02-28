class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def show?
    true
  end

  def my_products?
    true
  end

  def helicopters?
    true
  end

  def cars?
    true
  end

  def planes?
    true
  end

  def yachts?
    true
  end

  def others?
    true
  end

  def categories?
    true
  end

end
