class Games::EditCard < BaseComponent
  needs game : Game
  needs operation : SaveGame

  def render
    tag "turbo-frame", id: "game-#{game.id}" do
      div class: "flex shadow-2xl justify-evenly mt-6" do
        div do
          h2 "Sheet #{game.sheet}", class: "card-title"

          form_for Games::Presenting::Update.with(game.id), data_turbo_frame: "draw-#{draw.id}-games", class: "inline" do
            if game.presenting?
              hidden_input SaveBonspiel.new(game.bonspiel!).presenting_game_id, value: ""
              submit "Present!", class: "btn btn-xs btn-success"
            else
              hidden_input SaveBonspiel.new(game.bonspiel!).presenting_game_id, value: game.id
              submit "Present!", class: "btn btn-xs btn-error"
            end
          end
        end
        div class: "grid text-center grid-cols-3" do
          mount Games::AutoSavingInput, operation.team_a_name, game: game
          div "End"
          mount Games::AutoSavingInput, operation.team_b_name, game: game
          mount Games::IncrementingStatValue, operation.team_a_score, game: game, disabled: game.final?
          mount Games::IncrementingStatValue, operation.current_end, game: game, disabled: game.final?
          mount Games::IncrementingStatValue, operation.team_b_score, game: game, disabled: game.final?
          form_for Games::Update.with(game.id) do
            hidden_input operation.team_a_hammer, value: true
            submit "Hammer", class: "#{disabled_class} btn btn-xs #{game.team_a_hammer? ? "btn-primary" : ""}"
          end
          div do
            form_for Games::Update.with(game.id), class: "inline" do
              if game.final?
                hidden_input operation.final, value: false
                submit "Unfinalize", class: "btn btn-xs btn-ghost", data_confirm: "Are you sure you want to unfinalize this game?"
              else
                hidden_input operation.final, value: true
                submit "Finalize", class: "btn btn-xs btn-secondary", data_confirm: "Are you sure you want to finalize this game?"
              end
            end
          end
          form_for Games::Update.with(game.id) do
            hidden_input operation.team_a_hammer, value: false
            submit "Hammer", class: "btn btn-xs #{game.team_b_hammer? ? "btn-primary" : ""} #{disabled_class}"
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
