class Draws::ShowPage < MainLayout
  needs draw : Draw
  quick_def page_title, "Draw with id: #{draw.id}"

  def content
    render_breadcrumbs
    para do
      text draw.start_at.in(Time::Location.load("America/Chicago")).to_s
    end
  end

  def render_breadcrumbs
    mount Shared::Breadcrumbs do
      li do
        link "Bonspiel: #{draw.bonspiel!.name}", Bonspiels::Show.with(draw.bonspiel_id)
      end
      li do
        link "Draw: #{draw.start_at.in(Time::Location.load("America/Chicago"))}", Draws::Show.with(draw.id)
      end
    end
  end
end
