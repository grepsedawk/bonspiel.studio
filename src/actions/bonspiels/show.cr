class Bonspiels::Show < BrowserAction
  get "/bonspiels/:bonspiel_id" do
    html ShowPage, bonspiel: BonspielQuery
      .new
      .preload_draws(DrawQuery.new.start_at.asc_order)
      .find(bonspiel_id)
  end
end
