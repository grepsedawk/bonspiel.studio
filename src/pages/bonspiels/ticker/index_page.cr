class Bonspiels::Ticker::IndexPage < ScoreboardLayout
  needs games : GameQuery
  # TODO: How long to refresh ticker for draw changes? Can OBS refresh manually?
  quick_def :refresh_time, 10.minutes

  def content
    tag "turbo-frame", data_controller: "cycleFrame", class: "grid h-fit overflow-hidden" do
      games.each_with_index do |game, index|
        tag "turbo-frame", id: "game-scoreboard-#{game.id}", src: Bonspiels::Ticker::Show.with(game.id).path, class: "#{hidden(index > 0)} col-start-1 row-start-1"
      end
    end
  end

  def hidden(hidden : Bool)
    hidden ? "hidden" : ""
  end
end
