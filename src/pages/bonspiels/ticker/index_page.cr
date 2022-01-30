class Bonspiels::Ticker::IndexPage < ScoreboardLayout
  needs games : GameQuery
  quick_def :refresh_time, 10.minutes

  def content
    tag "turbo-frame", data_controller: "cycleFrame" do
      games.each_with_index do |game, index|
        tag "turbo-frame", id: "game-scoreboard-#{game.id}", src: Bonspiels::Ticker::Show.with(game.id).path, class: index > 0 ? "hidden" : ""
      end
    end
  end
end
