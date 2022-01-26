class Bonspiels::Scoreboard::IndexPage < ScoreboardLayout
  needs game : Game
  quick_def :page_title, "Scoreboard"

  def content
    tag "turbo-frame",
      src: Games::Scoreboard::Index.with(game.id).path,
      id: "game-#{game.id}-scoreboard",
      data_controller: "refresh"
  end
end
