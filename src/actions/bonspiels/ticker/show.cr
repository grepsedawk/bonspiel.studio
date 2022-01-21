class Bonspiels::Ticker::Show < BrowserAction
  include Auth::AllowGuests

  get "/ticker/:game_id" do
    html Bonspiels::Ticker::ShowPage, game: GameQuery.find(game_id)
  end
end
