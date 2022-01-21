class Games::Update < BrowserAction
  put "/games/:game_id" do
    game = GameQuery.find(game_id)

    SaveGame.update(game, params) do |operation, updated_game|
      html UpdatePage, operation: operation, game: updated_game
    end
  end
end
