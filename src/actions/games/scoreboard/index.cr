class Games::Scoreboard::Index < BrowserAction
  include Auth::AllowGuests

  get "/games/:game_id/scoreboard" do
    game = GameQuery.find(game_id)

    html Games::Scoreboard::IndexPage, game: game
  end
end
