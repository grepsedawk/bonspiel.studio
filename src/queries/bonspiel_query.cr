class BonspielQuery < Bonspiel::BaseQuery
  def self.for(user : User)
    new.where(&.owner_id(user.id))
  end
end
