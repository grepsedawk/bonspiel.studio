class Draw < BaseModel
  table do
    column start_at : Time # TODO UK start_at + bonspiel_id, force within bonspiel
    belongs_to bonspiel : Bonspiel
  end

  def to_s
    start_at.in(Time::Location.load("America/Chicago")).to_s
  end
end
