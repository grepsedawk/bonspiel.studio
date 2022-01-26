class Games::EditCard < BaseComponent
  needs game : Game
  needs operation : SaveGame

  def render
    tag "turbo-frame", id: "game-#{game.id}" do
      div class: "card shadow bg-base-100 mt-6" do
        div class: "card-body" do
          h2 "Sheet #{game.sheet}", class: "card-title"
          form_for Games::Update.with(game.id), data_turbo_frame: "_top" do
            if game.presenting?
              hidden_input operation.presenting, value: false
              submit "Present!", class: "btn btn-success"
            else
              hidden_input operation.presenting, value: true
              submit "Present!", class: "btn btn-error"
            end
          end
          div class: "stats mt-3" do
            div class: "stat place-items-center place-content-center" do
              mount Games::AutoSavingInput, operation.team_a_name, game: game, append_class: "stat-title"
              mount Games::IncrementingStatValue, operation.team_a_score, game: game
              mount Games::AutoSavingInput, operation.team_a_club_name, game: game, append_class: "stat-desc", placeholder: "Club Name"
              form_for Games::Update.with(game.id), class: "stat-actions" do
                hidden_input operation.team_a_hammer, value: true
                submit "Hammer", class: "btn #{game.team_a_hammer? ? "btn-primary" : ""}"
              end
            end
            div class: "stat place-items-center place-content-center" do
              div "End", class: "stat-title"
              mount Games::IncrementingStatValue, operation.current_end, game: game
              div class: "stat-desc" do
                text "Good Curling!"
              end
              if game.final?
                form_for Games::Update.with(game.id), class: "stat-actions" do
                  hidden_input operation.final, value: false
                  submit "Unfinalize", class: "btn btn-ghost"
                end
              else
                form_for Games::Update.with(game.id), class: "stat-actions" do
                  hidden_input operation.final, value: true
                  submit "Finalize", class: "btn btn-secondary", data_confirm: "Are you sure?"
                end
              end
            end
            div class: "stat place-items-center place-content-center" do
              mount Games::AutoSavingInput, operation.team_b_name, game: game, append_class: "stat-title"
              mount Games::IncrementingStatValue, operation.team_b_score, game: game
              mount Games::AutoSavingInput, operation.team_b_club_name, game: game, append_class: "stat-desc", placeholder: "Club Name"
              form_for Games::Update.with(game.id), class: "stat-actions" do
                hidden_input operation.team_a_hammer, value: false
                submit "Hammer", class: "btn #{game.team_b_hammer? ? "btn-primary" : ""}"
              end
            end
          end
        end
      end
    end
  end
end
