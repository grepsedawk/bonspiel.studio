class Games::Scoreboard::IndexPage
  include Lucky::HTMLPage
  needs game : Game

  def render
    mount Games::ScoreboardCard, game: game
  end
end
