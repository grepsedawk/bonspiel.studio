class Draws::ShowPage < MainLayout
  needs draw : Draw
  quick_def page_title, "Draw with id: #{draw.id}"

  def content
    render_breadcrumbs
    render_switcher
    render_games
  end

  def render_games
    draw.games!.each do |game|
      mount Games::EditCard, game: game, operation: SaveGame.new(game)
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

  def render_switcher
    div class: "btn-group" do
      previous_draw_button
      link draw.start_at.in(Time::Location.load("America/Chicago")).to_s, Draws::Show.with(draw.id), class: "btn btn-active"
      next_draw_button
    end
  end

  def previous_draw_button
    if previous = draw.previous
      link "👈", Draws::Show.with(previous.id), class: "btn"
    else
      div class: "btn btn-disabled" { text "👈" }
    end
  end

  def next_draw_button
    if next_draw = draw.next
      link "👉", Draws::Show.with(next_draw.id), class: "btn"
    else
      div class: "btn btn-disabled" { text "👉" }
    end
  end
end
