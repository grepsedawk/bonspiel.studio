class Bonspiels::Overview::IndexPage < ScoreboardLayout
  needs games : GameQuery
  quick_def :refresh_time, 1.minute

  def content
    div class: "space-y-3 opacity-80" do
      games.each do |game|
        tag "turbo-frame", class: "animate-none-all block", id: "game-scoreboard-#{game.id}", src: Bonspiels::Ticker::Show.with(game.id).path
      end
    end
  end
end
