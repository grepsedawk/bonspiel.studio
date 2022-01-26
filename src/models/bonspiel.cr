class Bonspiel < BaseModel
  table do
    column name : String
    column start_at : Time
    column end_at : Time
    column sheets : Int16
    belongs_to owner : User
    has_many draws : Draw
    has_many games : Game, through: [:draws, :games]
  end

  def to_s
    "#{name} (#{start_at})"
  end
end
