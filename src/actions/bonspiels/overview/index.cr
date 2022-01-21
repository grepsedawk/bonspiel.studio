class Bonspiels::Overview::Index < BrowserAction
  include Auth::AllowGuests

  get "/bonspiels/:bonspiel_id/overview" do
    bonspiel = BonspielQuery.find(bonspiel_id)

    bonspiel.presenting_game!.try do |game|
      return html IndexPage, games: GameQuery.new
        .draw_id(game.draw_id)
        .sheet.asc_order
    end

    head 200
  end
end
