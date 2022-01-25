class Games::UpdatePage
  include Lucky::HTMLPage
  needs game : Game
  needs operation : SaveGame
  quick_def page_title, "Game with id: #{game.id}"

  def render
    mount Games::EditCard, operation: operation, game: game
  end
end
