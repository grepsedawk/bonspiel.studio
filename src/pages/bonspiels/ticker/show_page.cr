class Bonspiels::Ticker::ShowPage < Bonspiels::Scoreboard::IndexPage
  def content
    tag "turbo-frame", id: "game-scoreboard-#{game.id}" do
      super
    end
  end
end
