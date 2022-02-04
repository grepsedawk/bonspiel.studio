class Bonspiels::Ticker::ShowPage < Bonspiels::Scoreboard::IndexPage
  def content
    tag "turbo-frame", id: "game-scoreboard-#{game.id}" do
      div class: "scoreboard space-y-1 sm:space-y-0 sm:flex gap-2 animate-slide-in w-screen" do
        div "Sheet #{game.sheet}", class: "btn"
        div "End #{game.current_end}", class: "btn"
        div class: "btn-group min-w-0 flex-1 flex-nowrap" do
          div class: "flex-1 min-w-0 btn" do
            div game.team_a_name.to_s, class: "truncate"
          end
          hammer_button if game.team_a_hammer?
          div game.team_a_score.to_s, class: "btn"
        end
        div class: "btn-group min-w-0 flex-1 flex-nowrap" do
          div class: "flex-1 min-w-0 btn" do
            div game.team_b_name.to_s, class: "truncate"
          end
          hammer_button if game.team_b_hammer?
          div game.team_b_score.to_s, class: "btn"
        end
      end
    end
  end
end
