class Bonspiels::Show < BrowserAction
  get "/bonspiels/:bonspiel_id" do
    html ShowPage, bonspiel: BonspielQuery
      .new
      .preload_draws(DrawQuery.new.sequence.asc_order)
      .find(bonspiel_id)
  end
end
