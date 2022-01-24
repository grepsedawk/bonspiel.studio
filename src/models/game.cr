class Game < BaseModel
  table do
    column sheet : Int16
    column team_a_score : Int16
    column team_b_score : Int16
    column current_end : Int16
    belongs_to draw : Draw
  end
end
