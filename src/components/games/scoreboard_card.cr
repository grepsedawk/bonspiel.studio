class Games::ScoreboardCard < BaseComponent
  needs game : Game

  def render
    tag "turbo-frame", id: "game-#{game.id}-scoreboard" do
      div class: "card card-bordered mt-6" do
        div class: "card-body" do
          h2 "Sheet #{game.sheet}", class: "card-title"
          text game.team_a_name
        end
      end
    end
  end
end
