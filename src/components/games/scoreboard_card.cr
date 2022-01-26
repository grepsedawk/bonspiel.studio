class Games::ScoreboardCard < BaseComponent
  needs game : Game

  def render
    tag "turbo-frame", id: "game-#{game.id}-scoreboard" do
      h2 "Sheet #{game.sheet}"
      div class: "stats" do
        div class: "stat place-items-center place-content-center" do
          div game.team_a_name.to_s, class: "stat-title"
          div game.team_a_score.to_s, class: "stat-value"
          div game.team_a_club_name.to_s, class: "stat-desc"
        end
        div class: "stat place-items-center place-content-center" do
          div "End", class: "stat-title"
          div game.current_end.to_s, class: "stat-value"
          div "Good Curling!", class: "stat-desc"
        end
        div class: "stat place-items-center place-content-center" do
          div game.team_b_name.to_s, class: "stat-title"
          div game.team_b_score.to_s, class: "stat-value"
          div game.team_b_club_name.to_s, class: "stat-desc"
        end
      end
    end
  end
end
