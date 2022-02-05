class BonspielPolicy < ApplicationPolicy(Bonspiel)
  def index?
    true # TODO
  end

  def show?
    record.try &.owner_id == user.try &.id
  end

  def create?
    true # TODO
  end

  def update?
    true # TODO
  end

  def delete?
    true # TODO
  end
end
