class Bonspiel < BaseModel
  table do
    column name : String
    column start_at : Time
    column end_at : Time
    belongs_to owner : User
  end

  def to_s
    name
  end
end
