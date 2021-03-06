class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def my_products?
    false
  end

  def helicopters?
    false
  end

  def cars?
    false
  end

  def planes?
    false
  end

  def yachts?
    false
  end

  def others?
    false
  end

  def my_reservations?
    false
  end

  def my_product_reservations?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
