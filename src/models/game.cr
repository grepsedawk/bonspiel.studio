class Game < BaseModel
  table do
    column sheet : Int16
    belongs_to draw : Draw
  end
end
