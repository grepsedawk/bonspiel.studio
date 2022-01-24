class Draw < BaseModel
  table do
    column start_at : Time
    belongs_to bonspiel : Bonspiel

    has_many games : Game
  end

  def games!
    return previous_def.sort_by(&.sheet) unless previous_def.empty?

    SaveGame.upsert(
      bonspiel!.sheets.times.map do |n|
        {sheet: n.to_i16 + 1, draw_id: self.id}
      end.to_a
    )
  end

  def to_s
    start_at.in(Time::Location.load("America/Chicago")).to_s
  end

  memoize def previous : Draw?
    DrawQuery.new
      .bonspiel_id(bonspiel_id)
      .start_at.lt(start_at)
      .start_at.desc_order
      .first?
  end

  memoize def next : Draw?
    DrawQuery.new
      .bonspiel_id(bonspiel_id)
      .start_at.gt(start_at)
      .start_at.asc_order
      .first?
  end
end
