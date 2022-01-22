class Draw < BaseModel
  table do
    column start_at : Time
    belongs_to bonspiel : Bonspiel
  end

  def to_s
    start_at.to_s
  end
end
