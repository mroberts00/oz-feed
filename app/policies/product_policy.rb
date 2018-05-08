class ProductPolicy < ApplicationPolicy

  def create?
    business.present
  end

  def update?
    return true if business.present? && business = product.business
  end

  def destroy?
    return true if business.present? && business = product.business
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
