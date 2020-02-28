class ReviewPolicy < ApplicationPolicy
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

  # def blank_stars?
  #   return true
  # end

   def destroy?
    record.user == user || record.product.user == user
  end

  def show?
    true
  end
end
