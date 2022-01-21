class Bonspiels::Ticker::Index < BrowserAction
  include Auth::AllowGuests

  get "/bonspiels/:bonspiel_id/ticker" do
    bonspiel = BonspielQuery.find(bonspiel_id)

    bonspiel.presenting_game!.try do |game|
      return html Bonspiels::Ticker::IndexPage, games: GameQuery.new
        .draw_id(game.draw_id)
        .id.not.eq(game.id)
        .sheet.asc_order
    end

    head 200
  end
end
