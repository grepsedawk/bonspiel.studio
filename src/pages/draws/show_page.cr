class Draws::ShowPage < MainLayout
  needs draw : Draw
  quick_def page_title, "Draw with id: #{draw.id}"

  def content
    render_breadcrumbs
    render_switcher
    render_games
  end

  def render_games
    tag "turbo-frame", id: "draw-#{draw.id}-games" do
      draw.games!.each do |game|
        mount Games::EditCard, game: game, operation: SaveGame.new(game)
      end
    end
  end

  def render_breadcrumbs
    mount Shared::Breadcrumbs do
      li do
        link "Bonspiel: #{bonspiel.name}", Bonspiels::Show.with(draw.bonspiel_id)
      end
      li do
        link "Draw: #{draw}", Draws::Show.with(draw.id)
      end
    end
  end

  def render_switcher
    mount Draws::Switcher, draw: draw
  end

  def bonspiel : Bonspiel
    draw.bonspiel!
  end
end
