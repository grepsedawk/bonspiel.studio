class Bonspiels::Scoreboard::Index < BrowserAction
  include Auth::AllowGuests

  get "/bonspiels/:bonspiel_id/scoreboard" do
    bonspiel = BonspielQuery.find(bonspiel_id)

    bonspiel.draws!.first.games!.first.try do |game|
      html Bonspiels::Scoreboard::IndexPage, game: game
    end
  end
end
