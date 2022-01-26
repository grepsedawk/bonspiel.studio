class Games::Scoreboard::Index < BrowserAction
  get "/games/:game_id/scoreboard" do
    game = GameQuery.find(game_id)

    html Games::Scoreboard::IndexPage, game: game
  end
end
