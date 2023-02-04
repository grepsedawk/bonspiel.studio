class Bonspiels::Scoreboard::Index < BrowserAction
  include Auth::AllowGuests

  get "/bonspiels/:bonspiel_id/scoreboard/?:sheet" do
    bonspiel = BonspielQuery.find(bonspiel_id)

    sheet.try(&.to_i).try do |sheet|
      bonspiel.presenting_game!.try do |game|
        return html Bonspiels::Scoreboard::IndexPage, game: game.draw!.games![sheet - 1]
      end
    end

    bonspiel.presenting_game!.try do |game|
      return html Bonspiels::Scoreboard::IndexPage, game: game
    end

    head 200
  end
end
