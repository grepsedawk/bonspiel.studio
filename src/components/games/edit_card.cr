class Games::EditCard < BaseComponent
  needs game : Game
  needs operation : SaveGame

  def render
    tag "turbo-frame", id: "game-#{game.id}" do
      div class: "card shadow bg-base-100 mt-6" do
        div class: "card-body" do
          h2 "Sheet #{game.sheet}", class: "card-title"
          form_for Games::Presenting::Update.with(game.id), data_turbo_frame: "draw-#{draw.id}-games" do
            if game.presenting?
              hidden_input SaveBonspiel.new(game.bonspiel!).presenting_game_id, value: ""
              submit "Present!", class: "#{disabled_class} btn btn-success"
            else
              hidden_input SaveBonspiel.new(game.bonspiel!).presenting_game_id, value: game.id
              submit "Present!", class: "#{disabled_class} btn btn-error"
            end
          end
          div class: "stats md:grid-flow-col grid-flow-row mt-3" do
            div class: "stat place-items-center place-content-center" do
              mount Games::AutoSavingInput, operation.team_a_name, game: game, append_class: "stat-title"
              mount Games::IncrementingStatValue, operation.team_a_score, game: game, disabled: game.final?
              mount Games::AutoSavingInput, operation.team_a_club_name, game: game, append_class: "stat-desc", placeholder: "Club Name"
              form_for Games::Update.with(game.id), class: "stat-actions" do
                hidden_input operation.team_a_hammer, value: true
                submit "Hammer", class: "#{disabled_class} btn #{game.team_a_hammer? ? "btn-primary" : ""}"
              end
            end
            div class: "stat place-items-center place-content-center order-last md:order-none" do
              div "End", class: "stat-title"
              mount Games::IncrementingStatValue, operation.current_end, game: game, disabled: game.final?
              div class: "stat-desc" do
                text "Good Curling!"
              end
              form_for Games::Update.with(game.id), class: "stat-actions" do
                if game.final?
                  hidden_input operation.final, value: false
                  submit "Unfinalize", class: "btn btn-ghost", data_confirm: "Are you sure you want to unfinalize this game?"
                else
                  hidden_input operation.final, value: true
                  submit "Finalize", class: "btn btn-secondary", data_confirm: "Are you sure you want to finalize this game?"
                end
              end
            end
            div class: "stat place-items-center place-content-center" do
              mount Games::AutoSavingInput, operation.team_b_name, game: game, append_class: "stat-title"
              mount Games::IncrementingStatValue, operation.team_b_score, game: game, disabled: game.final?
              mount Games::AutoSavingInput, operation.team_b_club_name, game: game, append_class: "stat-desc", placeholder: "Club Name"
              form_for Games::Update.with(game.id), class: "stat-actions" do
                hidden_input operation.team_a_hammer, value: false
                submit "Hammer", class: "btn #{game.team_b_hammer? ? "btn-primary" : ""} #{disabled_class}"
              end
            end
          end
        end
      end
    end
  end

  private def disabled_class : String
    game.final? ? "btn-disabled" : ""
  end

  private def draw : Draw
    game.draw!
  end
end
