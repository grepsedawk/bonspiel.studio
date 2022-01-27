class Bonspiels::Scoreboard::IndexPage < ScoreboardLayout
  needs game : Game
  quick_def :page_title, "Scoreboard"

  def content
    h2 "Sheet #{game.sheet}"
    div class: "grid grid-cols-2 max-w-xs" do
        div game.team_a_name.to_s
        div game.team_a_score.to_s
        div game.team_b_name.to_s
        div game.team_b_score.to_s
        div "End"
        div game.current_end.to_s
      end
    end
end
