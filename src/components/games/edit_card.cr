class Games::EditCard < BaseComponent
  needs game : Game
  needs operation : SaveGame

  def render
    tag "turbo-frame", id: "game-#{game.id}" do
      div class: "card card-bordered mt-6" do
        div class: "card-body" do
          h2 "Sheet #{game.sheet}", class: "card-title"
          div class: "stats" do
            div class: "stat place-items-center place-content-center" do
              div "Team A Name", class: "stat-title"
              mount Games::IncrementingStatValue, operation.team_a_score, game: game
              div "Club Name", class: "stat-desc"
            end
            div class: "stat place-items-center place-content-center" do
              div "End", class: "stat-title"
              mount Games::IncrementingStatValue, operation.current_end, game: game
              div class: "stat-desc" do
                text "Game started at: 20:20:20"
              end
            end
            div class: "stat place-items-center place-content-center" do
              div "Team B Name", class: "stat-title"
              mount Games::IncrementingStatValue, operation.team_b_score, game: game
              div "Club Name", class: "stat-desc"
            end
          end
        end
      end
    end
  end
end
