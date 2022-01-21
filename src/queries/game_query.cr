class GameQuery < Game::BaseQuery
  def selected
    where &.selected(true)
  end
end
