class Draws::ShowPage < MainLayout
  needs draw : Draw
  quick_def page_title, "Draw with id: #{draw.id}"

  def content
    link "Return to Bonspiel", Bonspiels::Show.with bonspiel_id: draw.bonspiel_id
    para do
      text draw.start_at.in(Time::Location.load("America/Chicago")).to_s
    end
  end
end
