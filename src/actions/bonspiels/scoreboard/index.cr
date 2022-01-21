class Bonspiels::Scoreboard::Index < BrowserAction
  include Auth::AllowGuests

  get "/bonspiels/:bonspiel_id/scoreboard" do
    bonspiel = BonspielQuery.find(bonspiel_id)

    bonspiel.presenting_game!.try do |game|
      return html Bonspiels::Scoreboard::IndexPage, game: game
    end

    head 200
  end
end
