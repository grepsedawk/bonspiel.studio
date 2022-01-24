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
              div class: "stat-value" do
                form_for Games::Update.with(game.id), class: "inline" do
                  hidden_input operation.team_a_score, value: Math.max(game.team_a_score - 1, 0)
                  submit "-", class: "btn btn-circle"
                end
                text game.team_a_score
                form_for Games::Update.with(game.id), class: "inline" do
                  hidden_input operation.team_a_score, value: game.team_a_score + 1
                  submit "+", class: "btn btn-circle"
                end
              end
              div "Club Name", class: "stat-desc"
            end
            div class: "stat place-items-center place-content-center" do
              div "End", class: "stat-title"
              div class: "stat-value" do
                form_for Games::Update.with(game.id), class: "inline" do
                  hidden_input operation.current_end, value: Math.max(game.current_end - 1, 0)
                  submit "-", class: "btn btn-circle"
                end
                text game.current_end
                form_for Games::Update.with(game.id), class: "inline" do
                  hidden_input operation.current_end, value: game.current_end + 1
                  submit "+", class: "btn btn-circle"
                end
              end
              div class: "stat-desc" do
                text "Game started at: 20:20:20"
              end
            end
            div class: "stat place-items-center place-content-center" do
              div "Team B Name", class: "stat-title"
              div class: "stat-value" do
                form_for Games::Update.with(game.id), class: "inline" do
                  hidden_input operation.team_b_score, value: Math.max(game.team_b_score - 1, 0)
                  submit "-", class: "btn btn-circle"
                end
                text game.team_b_score
                form_for Games::Update.with(game.id), class: "inline" do
                  hidden_input operation.team_b_score, value: game.team_b_score + 1
                  submit "+", class: "btn btn-circle"
                end
              end
              div "Club Name", class: "stat-desc"
            end
          end
        end
      end
    end
  end
end
