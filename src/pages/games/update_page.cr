class Games::UpdatePage < MainLayout
  needs game : Game
  needs operation : SaveGame
  quick_def page_title, "Game with id: #{game.id}"

  def content
    mount Games::EditCard, operation: operation, game: game
  end
end
