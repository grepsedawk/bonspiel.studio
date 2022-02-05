class Bonspiels::Show < BrowserAction
  get "/bonspiels/:bonspiel_id" do
    bonspiel = BonspielQuery
      .new
      .preload_draws(DrawQuery.new.start_at.asc_order)
      .find(bonspiel_id)

    authorize(bonspiel)

    html ShowPage, bonspiel: bonspiel
  end
end
