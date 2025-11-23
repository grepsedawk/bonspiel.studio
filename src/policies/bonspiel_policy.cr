class BonspielPolicy < ApplicationPolicy(Bonspiel)
  def index?
    true
  end

  def show?
    record.try &.owner_id == user.try &.id
  end

  def create?
    !user.nil?
  end

  def update?
    record.try &.owner_id == user.try &.id
  end

  def delete?
    record.try &.owner_id == user.try &.id
  end
end
