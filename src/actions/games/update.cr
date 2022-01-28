class Games::Update < BrowserAction
  put "/games/:game_id" do
    game = GameQuery.find(game_id)

    SaveGame.update(game, params) do |operation, updated_game|
      if top?
        redirect Draws::Show.with(game.draw_id)
      else
        html UpdatePage, operation: operation, game: updated_game
      end
    end
  end

  private def top?
    params.to_h["game"]["presenting"]

    true
  rescue KeyError
    false
  end
end
