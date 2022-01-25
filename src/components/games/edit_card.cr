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
              mount Games::AutoSavingInput, operation.team_a_name, game: game
              mount Games::IncrementingStatValue, operation.team_a_score, game: game
              mount Games::AutoSavingInput, operation.team_a_club_name, game: game, append_class: "stat-desc"
            end
            div class: "stat place-items-center place-content-center" do
              div "End", class: "stat-title"
              mount Games::IncrementingStatValue, operation.current_end, game: game
              div class: "stat-desc" do
                text "Game started at: 20:20:20"
              end
            end
            div class: "stat place-items-center place-content-center" do
              mount Games::AutoSavingInput, operation.team_b_name, game: game
              mount Games::IncrementingStatValue, operation.team_b_score, game: game
              mount Games::AutoSavingInput, operation.team_b_club_name, game: game, append_class: "stat-desc"
            end
          end
        end
      end
    end
  end
end
