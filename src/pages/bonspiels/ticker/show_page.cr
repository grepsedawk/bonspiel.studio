class Bonspiels::Ticker::ShowPage < Bonspiels::Scoreboard::IndexPage
  def content
    tag "turbo-frame", id: "game-scoreboard-#{game.id}" do
        div class: "scoreboard flex text-center gap-2 animate-slide-in" do
        div class: "btn-group flex-1 flex" do
          hammer_button if game.team_a_hammer?
          div game.team_a_name.to_s, class: "flex-1 btn"
          div game.team_a_score.to_s, class: "btn"
        end
        div "#{ordinal(game.current_end)} End", class: "btn"
        div "Sheet #{game.sheet}", class: "btn"
        div class: "btn-group flex-1 flex" do
          div game.team_b_score.to_s, class: "btn"
          div game.team_b_name.to_s, class: "flex-1 btn"
          hammer_button if game.team_b_hammer?
        end
      end
    end
  end
end
