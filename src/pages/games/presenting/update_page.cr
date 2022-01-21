class Games::Presenting::UpdatePage
  include Lucky::HTMLPage
  needs draw : Draw
  needs operation : SaveBonspiel
  quick_def page_title, "Game with id: #{game.id}"

  def render
    tag "turbo-frame", id: "draw-#{draw.id}-games" do
      draw.games!.each do |game|
        mount Games::EditCard, operation: SaveGame.new(game), game: game
      end
    end
  end
end
