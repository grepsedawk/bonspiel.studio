class Games::Presenting::Update < BrowserAction
  put "/games/:game_id/presenting" do
    game = GameQuery.find(game_id)
    bonspiel = game.bonspiel!

    SaveBonspiel.update(bonspiel, params) do |operation, _|
      html UpdatePage, operation: operation, draw: game.draw!
    end
  end
end
