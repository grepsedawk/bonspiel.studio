class Bonspiel < BaseModel
  table do
    column name : String
    column start_at : Time # TODO: Start at must come before end_at
    column end_at : Time
    column sheets : Int16
    belongs_to owner : User
    has_many draws : Draw
  end

  def to_s
    "#{name} (#{start_at})"
  end
end
